/*
 * Config for ContainerScript.
 * A better way to manage which websites should be loaded in which containers.
 * https://github.com/icholy/ContainerScript
 *
 * Pairs well with "Open URL in Container"
 * https://github.com/honsiorovskyi/open-url-in-container
 */

switch (url.host) {
    /*
     * PERSONAL
     */
    case "www.bookcrossing.com":
    case "app.todoist.com":
    case "www.todoist.com":
    case "app.todoist.com":
    case "www.wikiloc.com":
    case "obsidian.md":
    case "console.anthropic.com": {
        return "personal"
    }

    case "mintlify.com":
        {
            return "Rough.app"
        }

    case "claude.ai": {
        return "projects"
    }

    case "www.airbnb.co.nz": {
        return "george@czabania.com"
    }

    case "www.google.co.nz":
    case "www.google.com": {
        if (url.pathname.startsWith("/maps/")) {
            return "george@czabania.com"
        }
    }

    case "segment.com":
        {
            return "george@runn.io"
        }

    case "gist.github.com":
    case "github.com": {
        // do not change containers when authenticating...
        if (url.pathname.startsWith("/session")) {
            return undefined
        }
        if (url.pathname.toLowerCase().startsWith("/runn-fast/")) {
            return "george@runn.io"
        }
        return "projects"
    }

    case "linear.app": {
        if (url.pathname.toLowerCase().startsWith("/runn")) {
            return "george@runn.io"
        }
        return "projects"
    }
}
