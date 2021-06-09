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

switch (command) {
  case 'rs':
  case 'restart': {
    const app = args[0]
    await $`docker-compose stop --time 0 ${app}`
    await $`docker-compose up --detach ${app}`
    await $`docker-compose logs --tail 500 --follow ${app}`
    break
  }

  case 'rebuild-db':
    await $`docker-compose exec -T app rake db:drop db:create db:migrate`
    await $`docker-compose exec -T app rake db:seed`
    break
}
