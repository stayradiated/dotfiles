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
  case 'test': {
    log(`docker-compose exec -T app yarn run test`)
    break
  }

  case 'fmt': {
    if (args.length > 0) {
      log(`docker-compose exec -T app npx prettier --write ${args.join(' ')}`)
    } else {
      log(`docker-compose exec -T app yarn run fmt`)
    }
    break
  }

  case 'lint': {
    log(`docker-compose exec -T app yarn run lint`)
    break
  }

  case 'tsc':
  case 'build': {
    log(`docker-compose exec -T app yarn run tsc --pretty ${args.join(' ')}`)
    break
  }

  case 'reset': {
    const app = args[0] ?? ''
    log(`docker-compose up --detach --remove-orphans --renew-anon-volumes ${app}`)
    break
  }

  case 'up':
  case 'start': {
    const app = args[0] ?? ''
    log(`docker-compose up --detach --remove-orphans ${app}`)
    break
  }

  case 'down':
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

  case 'rake': {
    log(`docker-compose exec -T app rake ${args.join(' ')}`)
  }

  case 'db': {
    const subcommand = args[0] ?? ''
    switch (subcommand) {
      case 'migrate': {
        log(`docker-compose exec -T app rake db:migrate`)
        break
      }
      case 'seed': {
        log(`docker-compose exec -T app rake db:seed`)
        break
      }
      case 'rebuild': {
        log(`docker-compose exec -T app rails db:environment:set RAILS_ENV=development;`)
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

  case 'export': {
    const subcommand = args[0] ?? ''
    switch (subcommand) {
      case 'hasura': {
        log('yarn run hasura:export')
        break
      }
    }
    break
  }

  case 'graphql': {
    log(`docker-compose exec -T app yarn run graphql`)
    break
  }

  case 'relay': {
    log(`docker-compose exec -T app yarn run relay`)
    break
  }

  case 'l':
  case 'logs': {
    const app = args[0] ?? ''
    log(`docker-compose logs --no-log-prefix --tail 500 --follow ${app}`)
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
