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
	/*
 ████████   █████████ ████████       ██████       █████      ████     ███       ██        ███
 ███    ███ ███       ███    ███   ███    ███   ███    ███   ██ ███   ███      ██ ██      ███
 ███    ███ ███       ███    ███    ███       ███        ███ ███ ███  ███     ██  ███     ███
 ████████   ███████   ██ ███          ███     ███        ███ ███  ███ ███    ███   ███    ███
 ███        ███       ███  ███           ███  ███        ███ ███   ██ ███   ███████ ███   ███
 ███        ███       ███    ███   ███    ███   ███     ███  ███    ██ ██  ███       ███  ███
 ███        █████████ ███      ███   ██████       █████      ███      ███ ███         ███ ██████████
*/

	personal: [
		"www.anylist.com",
		"web.mapstr.com",
		"www.alltrails.com",
		"grok.com",
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
		"www2.logon.realme.govt.nz",
		"safetywing.com",
	],

	/*
 ████████         █████      ███     ███    █████     ███    ███
 ███    ███     ███    ███   ███     ███  ██    ███   ███    ███
 ███    ███   ███        ███ ███     ███ ██           ███    ███
 ██ ███       ███        ███ ███     ███ ███          ██████████
 ███  ███     ███        ███ ███     ███ ███   ██████ ███    ███
 ███    ███     ███     ███  ███     ███  ███    ██   ███    ███
 ███      ███     █████        ██████      ██████     ███    ███
*/
	"george@rough.app": [
		"teach.tldraw.com",
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
		"dozzle.rough.app",
		"otter.ai",
		"console.groq.com",
		"console.runpod.io",
		"runpod.io",
		{
			host: "fly.io",
			only: ["/dashboard/rough", "/apps/rough-"],
			skip: ["/app/"],
		},
	],

	/*
 ████████   ████████         █████           ███  █████████     ███    ███████████   ██████
 ███    ███ ███    ███     ███    ███        ███  ███        ███   ███     ███     ███    ███
 ███    ███ ███    ███   ███        ███      ███  ███       ███            ███      ███
 ████████   ██ ███       ███        ███      ███  ███████   ███            ███        ███
 ███        ███  ███     ███        ███      ███  ███       ███            ███           ███
 ███        ███    ███     ███     ███  ██   ███  ███        ███   ███     ███     ███    ███
 ███        ███      ███     █████       █████    █████████    █████       ███       ██████
*/
	projects: [
		"127.0.0.144461",
		"aws.amazon.com",
		"lovable.dev",
		"gist.github.com",
		"svelte.dev",
		"github.com",
		"dashboard.partykit.io",
		"claude.ai",
		"codepen.io",
		{
			host: "linear.app",
			only: ["/rough/"],
		},
		{
			host: "fly.io",
			skip: ["/dashboard/rough/", "/apps/", "/app/", "/cli/"],
		},
	],

	/*
     ███    ████████ ███       ██        █████           ██        ████     ███ ███       ██
  ███   ███        ███        ██ ██      ██  ███        ██ ██      ██ ███   ███ ███      ██ ██
 ███              ███        ██  ███     ██   ███      ██  ███     ███ ███  ███ ███     ██  ███
 ███            ███         ███   ███    ██████       ███   ███    ███  ███ ███ ███    ███   ███
 ███           ███         ███████ ███   ██    ███   ███████ ███   ███   ██ ███ ███   ███████ ███
  ███   ███  ███          ███       ███  ██     ██  ███       ███  ███    ██ ██ ███  ███       ███
    █████   ████████████ ███         ███ ████ ███  ███         ███ ███      ███ ███ ███         ███
*/
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
			only: ["/maps"],
		},
		{
			host: "www.google.com",
			only: ["/maps"],
		},
	],

	/*
 █████████       ██            ███    █████████ █████         █████          █████      ███   ███
 ███            ██ ██       ███   ███ ███       ██  ███     ███    ███     ███    ███   ███  ███
 ███           ██  ███     ███        ███       ██   ███  ███        ███ ███        ███ ███ ███
 ███████      ███   ███    ███        ███████   ██████    ███        ███ ███        ███ ██ ██
 ███         ███████ ███   ███        ███       ██    ███ ███        ███ ███        ███ ███  ███
 ███        ███       ███   ███   ███ ███       ██     ██   ███     ███    ███     ███  ███   ███
 ███       ███         ███    █████   █████████ ████ ███      █████          █████      ███     ███
*/
	facebook: [
		"web.whatsapp.com",
		"www.facebook.com",
		"www.instagram.com",
		"www.messenger.com",
		"www.strava.com",
	],

	/*
   ██████   █████████ ████     ███   ██████   ███ ███████████ ███ ███         ███ █████████
 ███    ███ ███       ██ ███   ███ ███    ███ ███     ███     ███  ███       ███  ███
  ███       ███       ███ ███  ███  ███       ███     ███     ███   ███     ███   ███
    ███     ███████   ███  ███ ███    ███     ███     ███     ███    ███   ███    ███████
       ███  ███       ███   ██ ███       ███  ███     ███     ███     ███ ███     ███
 ███    ███ ███       ███    ██ ██ ███    ███ ███     ███     ███      █████      ███
   ██████   █████████ ███      ███   ██████   ███     ███     ███       ███       █████████
*/
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
		"app.simplicity.kiwi",
		"investnow.co.nz",
	],

	/*
 ███████████ ████████           ██        ███         ███ █████████ ███
     ███     ███    ███        ██ ██       ███       ███  ███       ███
     ███     ███    ███       ██  ███       ███     ███   ███       ███
     ███     ██ ███          ███   ███       ███   ███    ███████   ███
     ███     ███  ███       ███████ ███       ███ ███     ███       ███
     ███     ███    ███    ███       ███       █████      ███       ███
     ███     ███      ███ ███         ███       ███       █████████ ██████████
*/
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

	// 1Password
	"1Password": ["my.1password.com"],

	// Spotify - stayradiated
	"spotify - stayradiated": ["soundiiz.com", "www.deezer.com"],
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
					// Check skip conditions
					if (rule.skip) {
						if (rule.skip.some((path) => url.pathname.startsWith(path))) {
							continue;
						}
					}

					// Check only conditions
					if (rule.only) {
						if (rule.only.some((path) => url.pathname.startsWith(path))) {
							return container;
						}
						continue;
					}

					// No conditions means always match
					return container;
				}
			}
		}
	}

	// No match found
	return undefined;
}

// Main entry point
if (typeof url !== "undefined") {
	return getContainer(url);
}

module.exports.getContainer = getContainer;
