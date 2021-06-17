/*
 * process.argv = [
 *  '/usr/local/bin/node',
 *  '/usr/local/bin/xz',
 *  'home/admin/dotfiles/bin/runn.mjs',
 *  'command',
 *  'arg1', 'arg2', 'arg3'
 * ]
 */

const [command, ...args] = process.argv.slice(3)

cd('/home/admin/src/github.com/Runn-Fast/runn')

switch (command) {
  case 'start': {
    const app = args[0] ?? ''
    await $`docker-compose up --detach --remove-orphans ${app}`
    break
  }

  case 'stop': {
    const app = args[0] ?? ''
    await $`docker-compose stop --time 0 ${app}`
    break
  }

  case 'rs':
  case 'restart': {
    const app = args[0] ?? ''
    await $`docker-compose stop --time 0 ${app}`
    await $`docker-compose up --detach ${app}`
    await $`docker-compose logs --tail 500 --follow ${app}`
    break
  }

  case 'db': {
    const subcommand = args[0] ?? ''
    switch (subcommand) {
      case 'migrate': {
        await $`docker-compose exec -T app rake db:migrate`
        break
      }
      case 'rebuild': {
        await $`docker-compose exec -T app rake db:drop db:create db:migrate`
        await $`docker-compose exec -T app rake db:seed`
        break
      }
    }
    break
  }

  case 'l':
  case 'logs': {
    const app = args[0] ?? ''
    await $`docker-compose logs --tail 500 --follow ${app}`
    break
  }

  case 'ps':
  case 'status': {
    await $`docker-compose ps --all`
    break
  }

  case 'help':
  case '--help': {
    console.log(`
runn start [app]
runn stop [app]
runn db migrate
runn db rebuild
runn logs [app]
runn status [app]
    `)
  }
}
