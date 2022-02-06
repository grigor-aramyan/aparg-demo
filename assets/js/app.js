// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import deps with the dep name or local files with a relative path, for example:
//
//     import {Socket} from "phoenix"
//     import socket from "./socket"
//
import "phoenix_html"

(function() {
    const uris = document.getElementById('uris');
    if (uris) {
        const urisArray = uris.value.split(':::');
        
        if (!urisArray.length) return;

        let nullifiedImages = [];
        urisArray.forEach(i => {
            nullifiedImages.push(i);
        });

        const operations = JSON.stringify({
            query: `mutation($images: [String!]) {
                createTimeline(images: $images)
            }`,
            variables: {
                "images": nullifiedImages
            }
        });

        console.log('operations', operations);

        // else babel gives regenaratorRuntime is not defined error
        setTimeout(() => {
            fetch("/api/graphql", {
                body: operations,
                method: "post",
                headers: {
                    'Content-Type': 'application/json',
                    'Content-Length': operations.length,    
                },
            }).then(async res => {
                const json = await res.json();

                // getting uri of generated timeline video
                console.log('data', json.data.createTimeline)
            }).catch(err => {
                console.log('error', JSON.stringify(err));
            })
        }, 500);
    }
})();
