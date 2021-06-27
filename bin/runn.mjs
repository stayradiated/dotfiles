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

const log = (message) => {
  console.log(message.replace(/\n/g, ' '))
}

switch (command) {
  case 'reset': {
    const app = args[0] ?? ''
    log(`docker-compose up --detach --remove-orphans --renew-anon-volumes ${app}`)
    break
  }

  case 'start': {
    const app = args[0] ?? ''
    log(`docker-compose up --detach --remove-orphans ${app}`)
    break
  }

  case 'stop': {
    const app = args[0] ?? ''
    log(`docker-compose stop --time 0 ${app}`)
    break
  }

  case 'rs':
  case 'restart': {
    const app = args[0] ?? ''
    log(`
      docker-compose stop --time 0 ${app} &&
      docker-compose up --detach ${app} &&
      docker-compose logs --tail 500 --follow ${app}
    `)
    break
  }

  case 'db': {
    const subcommand = args[0] ?? ''
    switch (subcommand) {
      case 'migrate': {
        log(`docker-compose exec -T app rake db:migrate`)
        break
      }
      case 'rebuild': {
        log(`docker-compose exec -T app rake db:drop db:create db:migrate && docker-compose exec -T app rake db:seed`)
        break
      }

      case 'pgcli': {
        log(`pgcli postgres://postgres:H3JjmJ5W@172.17.0.1:23001/runn_development`)
        break
      }
    }
    break
  }

  case 'l':
  case 'logs': {
    const app = args[0] ?? ''
    log(`docker-compose logs --tail 500 --follow ${app}`)
    break
  }

  case 'ps':
  case 'status': {
    log(`docker-compose ps --all`)
    break
  }

  case 'help':
  case '--help': {
    log(`echo "runn [start | stop | restart | db | logs | status]"`)
  }
}
