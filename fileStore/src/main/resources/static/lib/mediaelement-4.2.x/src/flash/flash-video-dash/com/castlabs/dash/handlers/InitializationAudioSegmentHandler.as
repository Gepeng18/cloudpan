/*
 * Copyright (c) 2014 castLabs GmbH
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

package static.lib.mediaelement - 4.2.x.src.flash.flash - video - dash.com.castlabs.dash.handlers {
import com.castlabs.dash.DashContext;
import com.castlabs.dash.boxes.FLVTag;
import com.castlabs.dash.boxes.SampleEntry;

import flash.utils.ByteArray;

public class InitializationAudioSegmentHandler extends InitializationSegmentHandler {
    public function InitializationAudioSegmentHandler(context:DashContext, ba:ByteArray) {
        super(context, ba);
    }

    override protected function get expectedTrackType():String {
        return 'soun';
    }

    protected override function buildMessage(sampleEntry:SampleEntry):FLVTag {
        var message:FLVTag = _context.buildFLVTag();

        message.markAsAudio();

        message.timestamp = 0;

        message.length = sampleEntry.data.length;

        message.data = new ByteArray();
        sampleEntry.data.readBytes(message.data, 0, sampleEntry.data.length);

        message.setup = true;

        return message;
    }
}
}
