
import {config, library, dom} from '@fortawesome/fontawesome-svg-core';

// Change the config to fix the flicker
config.mutateApproach = 'sync';
config.autoAddCss = false;

// An example icon
import {faFacebookSquare, faTwitterSquare, faGoogle, faLinkedin} from '@fortawesome/free-brands-svg-icons';

import {faThList, faSignInAlt, faCog, faSignOutAlt, faUserGraduate, faStaffAesculapius, faBuildingColumns} from '@fortawesome/free-solid-svg-icons';

import {faAngry} from '@fortawesome/free-regular-svg-icons';

library.add(
    faThList, faSignInAlt, faFacebookSquare, faTwitterSquare, faGoogle, faLinkedin, faCog, faSignOutAlt,faUserGraduate,faStaffAesculapius,faBuildingColumns
);


dom.watch();
