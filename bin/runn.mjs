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

const fail = (message) => {
  console.log(message)
  process.exit(1)
}

switch (command) {
  case 'test': {
    log(`docker-compose exec -T app yarn run test`)
    break
  }

  case 'test:rspec': {
    log(`docker-compose exec -T app yarn run rspec ${args.join(' ')}`)
    break
  }

  case 'test:rails': {
    log(`
      docker-compose exec -T app rake db:migrate RAILS_ENV=test &&
      docker-compose exec -T app yarn run rake-test TESTOPTS="-v"
    `)
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
    const subcommand = args[0] ?? ''
    switch (subcommand) {
      case 'app': {
        log(`docker-compose exec -T app yarn run lint:app --fix`)
        break
      }
      case 'cypress': {
        log(`docker-compose exec -T app yarn run lint:cypress --fix`)
        break
      }
      case 'file': {
        log(`docker-compose exec -T app yarn run eslint --fix ${args.slice(1).join(' ')}`)
        break
      }
      case 'ruby': {
        log(`
          docker-compose exec -T app yarn run erb-lint-correct
          && docker-compose exec -T app yarn run rubocop
        `)
        break
      }
    }
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
    log(`
      docker-compose up --detach --remove-orphans ${app} &&
      docker-compose logs --tail 500 --follow ${app}
    `)
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
      case 'seed:small': {
        log(`docker-compose exec -T app rake db:seed`)
        break
      }
      case 'seed:enterprise': {
        log(`docker-compose exec -T app rake db:seed_enterprise_team`)
        break
      }
      case 'dump': {
        const filename = args[1]
        if (!filename) {
          fail('You must specify a filename')
        }
        log(`
          docker-compose exec -T postgres pg_dump
            --username postgres
            --dbname runn_development
            --format custom
            --file /app/${filename}
        `)
        break
      }
      case 'restore': {
        const filename = args[1]
        if (!filename) {
          fail('You must specify a filename')
        }
        log(`
          docker-compose exec -T app rake db:drop db:create &&
          docker-compose exec -T postgres pg_restore -U postgres -d runn_development /app/${filename} &&
          docker-compose exec -T app rake db:migrate
        `)
        break
      }
      case 'rebuild': {
        log(`
          docker-compose exec -T app rails db:environment:set RAILS_ENV=development &&
          docker-compose exec -T app rake db:drop db:create db:migrate &&
          docker-compose exec -T app rake db:seed
        `)
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
    log(`docker-compose exec -T app yarn run hasura:graphql`)
    break
  }

  case 'relay': {
    log(`docker-compose exec -T app yarn run hasura:relay`)
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
