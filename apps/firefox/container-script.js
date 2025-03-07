/*
 * Config for ContainerScript.
 * A better way to manage which websites should be loaded in which containers.
 * https://github.com/icholy/ContainerScript
 *
 * Pairs well with "Open URL in Container"
 * https://github.com/honsiorovskyi/open-url-in-container
 */

// Container definitions
const containers = {
  // Personal container
  personal: [
    "www.bookcrossing.com",
    "app.todoist.com",
    "www.todoist.com",
    "www.wikiloc.com",
    "obsidian.md",
    "100.125.248.1142283",
    "100.125.248.1142342",
    "100.125.248.1146363",
    "103.18.59.787949",
    "accounthub.osleisure.com",
    "accounts.bahn.de",
    "accounts.forefront.ai",
    "admin.migadu.com",
    "anasail.skippersonline.net",
    "app.deltabadger.com",
    "app.hellosign.com",
    "app.mews.com",
    "app.plex.tv",
    "app.raindrop.io",
    "app.requestly.io",
    "app.simplelogin.io",
    "appstoreconnect.apple.com",
    "at.govt.nz",
    "auth.pret.com",
    "bandcamp.com",
    "bookings.doc.govt.nz",
    "bsky.app",
    "coinmarketcap.com",
    "crushentropy.com",
    "developer.apple.com",
    "discord.com",
    "dithering.fm",
    "dochub.com",
    "en.boardgamearena.com",
    "explore.osmaps.com",
    "fahrkarten.bahn.de",
    "federation.aucklandtransport.govt.nz",
    "gpx.studio",
    "hackmd.io",
    "hifi.kitchen",
    "intercity.co.nz",
    "itunesconnect.apple.com",
    "movieo.me",
    "nomadlist.com",
    "orlagartland.bandcamp.com",
    "osmaps.ordnancesurvey.co.uk",
    "pinboard.in",
    "reiseauskunft.bahn.de",
    "roamresearch.com",
    "secure.backblaze.com",
    "secure.splitwise.com",
    "send.firefox.com",
    "simplelogin.io",
    "store.steampowered.com",
    "stratechery.com",
    "stratechery.memberful.com",
    "toggl.com",
    "track.toggl.com",
    "trello.com",
    "vimeo.com",
    "volatile.co.nz",
    "web.ente.io",
    "webmail.migadu.com",
    "www.bikemap.net",
    "www.blablacar.co.uk",
    "www.booking.com",
    "www.brainscape.com",
    "www.cointracker.io",
    "www.computerlounge.co.nz",
    "www.dancarlin.com",
    "www.doc.govt.nz",
    "www.dropbox.com",
    "www.etsy.com",
    "www.expressvpn.com",
    "www.goodreads.com",
    "www.grammarly.com",
    "www.happygerman.com",
    "www.intercity.co.nz",
    "www.kraken.com",
    "www.meetup.com",
    "www.mxc.com",
    "www.netflix.com",
    "www.patreon.com",
    "www.perplexity.ai",
    "www.railcard.co.uk",
    "www.red-by-sfr.fr",
    "www.ryanair.com",
    "www.skinny.co.nz",
    "www.soundsair.com",
    "www.splitmyfare.co.uk",
    "www.splitwise.com",
    "www.stippl.io",
    "www.taste.io",
    "www.thetrainline.com",
    "www.trademe.co.nz",
    "www.trustedhousesitters.com",
    "www.ubereats.com",
    "www.walklakes.co.uk",
    "www.wunderground.com",
    "www.yha.org.uk",
    "www2.logon.realme.govt.nz"
  ],

  // Rough.app container
  "Rough.app": [
    "mintlify.com",
    "app.crisp.chat",
    "auth.campsite.co",
    "basecamp.com",
    "bowline.sentry.io",
    "flat.app",
    "resend.com",
    "roughapp.sentry.io",
    "webflow.com",
    "www.campsite.co",
    "www.mixedbread.ai",
    "www.vpscity.co.nz",
    "www.vpscity.co.nz65000",
  ],

  // Projects container
  projects: [
    "127.0.0.144461",
    "aws.amazon.com",
    "anthropic.com",
    "claude.ai",
    "console.anthropic.com",
    "gist.github.com",
    {
      host: "github.com",
      conditions: [
        // Skip authentication pages
        { path: "/session/", skip: true },
        // Specific organization patterns
        { path: "/runn-fast/", skip: true },
      ],
    },
    {
      host: "linear.app",
      conditions: [
        // Skip Runn pages
        { path: "/runn/", skip: true },
      ],
    },
  ],

  // Personal email container
  "george@czabania.com": [
    "app.bowline.ai",
    "bowline.stayradiated.com",
    "everytimezone.com",
    "in.rough.app",
    "login.tailscale.com",
    "natto.dev",
    "nz.bowline.ai",
    "product.bowline.ai",
    "richmondsquash.helloclub.com",
    "tailscale.com",
    "www.airbnb.co.uk",
    "www.airbnb.com",
    "www.airbnb.com.au",
    "www.airbnb.de",
    "www.airbnb.co.nz",
    "www.bowline.ai",
    "www.producthunt.com",
    "www.validatemysaas.com",
    {
      host: "www.google.co.nz",
      conditions: [{ path: "/maps/" }],
    },
    {
      host: "www.google.com",
      conditions: [{ path: "/maps/" }],
    },
  ],

  // Work email container
  "george@runn.io": [
    "segment.com",
    "app.runn.io",
    "action.parabol.co",
    "app-eu.merge.dev",
    "app.chargebee.com",
    "app.intercom.com",
    "app.linearb.io",
    "app.merge.dev",
    "app.myhr.works",
    "app.objectrocket.com",
    "app.runn-testing.net",
    "app.stackhawk.com",
    "app.tactiq.io",
    "auth.objectrocket.cloud",
    "azure.microsoft.com",
    "calendly.com",
    "cli-auth.heroku.com",
    "cloud.cypress.io",
    "crunchybridge.com",
    "dashboard.heroku.com",
    "depot.dev",
    "detectify.com",
    "dev-partner-runn.personio.de",
    "docs.readme.com",
    "eu.mixpanel.com",
    "hyperping.io",
    "id.heroku.com",
    "mixpanel.com",
    "miro.com",
    "rollbar.com",
    "runn-prod-eu-app.coralogix.com",
    "runn-staging-us-flagship-168e374bcd24.herokuapp.com",
    "runnapp.slack.com",
    "secure.zenefits.com",
    "secure2.ipayroll.co.nz",
    "signup.heroku.com",
    "staging.app.runn.io",
    "team-runn.1password.com",
    "threads.com",
    "uptimerobot.com",
    "us.runn.io",
    "whereby.com",
    "www.browserstack.com",
    "www.complish.app",
    "www.crunchydata.com",
    "www.gather.town",
    "www.heroku.com",
    "www.intercom.com",
    "www.intruder.io",
    "www.loom.com",
    "www.multitudes.co",
    "www.notion.so",
    "www.stackhawk.com",
    "zoom.us",
    {
      host: "github.com",
      conditions: [{ path: "/runn-fast/" }],
    },
    {
      host: "linear.app",
      conditions: [{ path: "/runn/" }],
    },
  ],

  // Spotify - stayradiated
  "spotify - stayradiated": ["soundiiz.com", "www.deezer.com"],

  // Facebook
  facebook: [
    "web.whatsapp.com",
    "www.facebook.com",
    "www.instagram.com",
    "www.messenger.com",
    "www.strava.com",
  ],

  // Sensitive only
  "sensitive only": [
    "account.squirrel.co.nz",
    "app.blockfi.com",
    "app.covid19.health.nz",
    "app.independentreserve.com",
    "auth.blockfi.com",
    "business.acc.co.nz",
    "dassetx.com",
    "easycrypto.ai",
    "easycrypto.com",
    "homebank.tsbbank.co.nz",
    "kiwi-coin.com",
    "login.health.nz",
    "login.nzpost.co.nz",
    "login.realme.govt.nz",
    "myir.ird.govt.nz",
    "mysecure.rabobank.co.nz",
    "secure.investnow.co.nz",
    "services.ird.govt.nz",
    "trade.swyftx.com.au",
    "transferwise.com",
    "wise.com",
    "www.independentreserve.com",
    "www.ird.govt.nz",
    "www.nzpost.co.nz",
    "www.tsb.co.nz",
    "www1.assert.realme.govt.nz",
    "www1.logon.realme.govt.nz",
  ],

  // 1Password
  "1Password": ["my.1password.com"],

  // Travel
  Travel: [
    "flightbookings.airnewzealand.co.nz",
    "lufthansa.miles-and-more.com",
    "wizzair.com",
    "www.airasia.com",
    "www.airnewzealand.co.nz",
    "www.easyjet.com",
    "www.expedia.com",
    "www.expedia.com.br",
    "www.lufthansa.com",
    "www.outsite.co",
  ],
};

// Main container selection logic
function getContainer(url) {
  for (const [container, rules] of Object.entries(containers)) {
    for (const rule of rules) {
      // Simple string host match
      if (typeof rule === "string") {
        if (url.host === rule) {
          return container;
        }
        continue;
      }

      // Complex rule with host and conditions
      if (rule.host) {
        const hostMatches = url.host === rule.host;

        if (hostMatches) {
          // No conditions means always match
          if (!rule.conditions || rule.conditions.length === 0) {
            return container;
          }

          // Check all conditions
          let skip = false;
          let matched = false;

          for (const condition of rule.conditions) {
            const pathMatches = url.pathname.toLowerCase().startsWith(condition.path.toLowerCase());

            if (pathMatches) {
              if (condition.skip) {
                skip = true;
                break;
              }
              matched = true;
            }
          }

          if (skip) {
            continue;
          }

          if (matched || rule.conditions.length === 0) {
            return container;
          }
        }
      }
    }
  }

  // No match found
  return undefined;
}

// Main entry point
return getContainer(url);
