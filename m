Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A151CFB91
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  8 Oct 2019 15:48:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iHpqk-0007yc-V4
	for lists+kgdb-bugreport@lfdr.de; Tue, 08 Oct 2019 13:48:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1iHpqi-0007yA-S5
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Oct 2019 13:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zRFXe3/XZQCUi1W0+GR//OOmf/+747T61SkEsMl88/k=; b=XK+4/ZjYolkrSqxBCA+H5lGQdy
 qIUlpvo8Yit0jIe9VQsE1XF+gRiEXA76oUsFG5oIlyRkMuxJDoB4TBQFEpisji4PDw7K7g7ww89oI
 oEuqhzFI4wIOn5ZEGYW4GTS36sd4G8+wLVDD1Nm222W0E/ohZRJ5ikL9kwf/TZ3PA+6Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zRFXe3/XZQCUi1W0+GR//OOmf/+747T61SkEsMl88/k=; b=UKZJF0JbOfh1AtXdnYexSyObbs
 CBQRC2ystCTml621Tj9FF69iS9YPG3gZfcHRKDe1ispplyF3gGYH174w/GkZIj2bUdC2XvbnesVmd
 NM4nfJJxOQi0deQccm3dTcEHLermYcYHYoO2LnPL0r6DyinC9LsWWgio47XOhsxFyQt8=;
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iHpqh-00319A-Hk
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Oct 2019 13:48:24 +0000
Received: by mail-wr1-f65.google.com with SMTP id v8so19517571wrt.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 08 Oct 2019 06:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zRFXe3/XZQCUi1W0+GR//OOmf/+747T61SkEsMl88/k=;
 b=tZfC1OM8yntNwmeY8DAkjskgZ4slX04meu2wTKakCs13kvAbXSBqEwTrQ9aC2yuPML
 OHcDHrf/kxg7FZQc/bw5zY+4gw2NEUUh+Kan7Efd79O7lwR4tYdG5Ez1HZlIt6tnd5g6
 RQnyvNGFQZCIWBeImePzvn0xNbkGynWCXxsrKdMTufPSnkx0Nw6NgQD/t19klEMPlGia
 +hbI4WRCv7GGXO50twrjV6esz8V7EnR3akgbWjXhCwYSEvIvCzJ1AxoPB2Mg/6V1KdUE
 19it6wJ7xMQ7755HDqWvENvwa/+R+1Kxtl2IQxVfBH7Tp1Eb6cujDx22F/QNnXvrxBnd
 zaSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zRFXe3/XZQCUi1W0+GR//OOmf/+747T61SkEsMl88/k=;
 b=XF+yBbds3JnXHFOwgc1/5EDRrY6qRe1GY/nemKMBs3hZNPCm39x4Mx8vL0ywBJsXCe
 NXTQoLKEDhEUGV75WD9HRokVl04GdamQsyk+tLjlNJDAa5gs1uUEe9BdaIWwO5o3CTPI
 seZ+dQvpNDmj40YRlFD5hDUhKAwHPaTCjebkEV7zIT88AXUZXdaNBwGpZQyKDsWwKRpJ
 +//TqK4qC/dB5AmKRqCLPSpaqstV+tVWNRHyQe6Bd6s2EgLxW/Hy+plCo1aY7VF6jABY
 CfjSr7MuEYCr5glPrqzS/6XdtTRdJ0YOOu8eW/us/qGuVk6/kfHAqwtZVnItx8rnR7ia
 Y7JQ==
X-Gm-Message-State: APjAAAWqlOgVEPRID7jus7fS5Dt/H5D/dnLvvp7AeZGkrauEYjmUNUmv
 ig9YxLeR/4tZWYjdbKHr5Nonzi6QMz5zTA==
X-Google-Smtp-Source: APXvYqwgrNAtVXxMcAt3CGH50mxfEVwuB6vCmi+Ycmt+f/kJStXemqbH+BSDPfEc5kcFu46toPhOYw==
X-Received: by 2002:adf:9d87:: with SMTP id p7mr25812577wre.245.1570540863921; 
 Tue, 08 Oct 2019 06:21:03 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id t8sm18237214wrx.76.2019.10.08.06.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 06:21:03 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Tue,  8 Oct 2019 14:20:42 +0100
Message-Id: <20191008132043.7966-5-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191008132043.7966-1-daniel.thompson@linaro.org>
References: <20191008132043.7966-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iHpqh-00319A-Hk
Subject: [Kgdb-bugreport] [PATCH v2 4/5] kdb: Improve handling of characters
 from different input sources
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: kgdb-bugreport@lists.sourceforge.net,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org,
 patches@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Currently if an escape timer is interrupted by a character from a
different input source then the new character is discarded and the
function returns '\e' (which will be discarded by the level above).
It is hard to see why this would ever be the desired behaviour.
Fix this to return the new character rather then the '\e'.

This is a bigger refactor that might be expected because the new
character needs to go through escape sequence detection.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/kdb/kdb_io.c | 37 ++++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index a9e73bc9d1c3..288dd1babf90 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -122,8 +122,8 @@ static int kdb_getchar(void)
 {
 #define ESCAPE_UDELAY 1000
 #define ESCAPE_DELAY (2*1000000/ESCAPE_UDELAY) /* 2 seconds worth of udelays */
-	char escape_data[5];	/* longest vt100 escape sequence is 4 bytes */
-	char *ped = escape_data;
+	char buf[4];	/* longest vt100 escape sequence is 4 bytes */
+	char *pbuf = buf;
 	int escape_delay = 0;
 	get_char_func *f, *f_escape = NULL;
 	int key;
@@ -145,27 +145,26 @@ static int kdb_getchar(void)
 			continue;
 		}
 
-		if (escape_delay == 0 && key == '\e') {
-			escape_delay = ESCAPE_DELAY;
-			ped = escape_data;
+		/*
+		 * When the first character is received (or we get a change
+		 * input source) we set ourselves up to handle an escape
+		 * sequences (just in case).
+		 */
+		if (f_escape != f) {
 			f_escape = f;
-		}
-		if (escape_delay) {
-			if (f_escape != f)
-				return '\e';
-
-			*ped++ = key;
-			key = kdb_read_handle_escape(escape_data,
-						     ped - escape_data);
-			if (key < 0)
-				return '\e';
-			if (key == 0)
-				continue;
+			pbuf = buf;
+			escape_delay = ESCAPE_DELAY;
 		}
 
-		break;	/* A key to process */
+		*pbuf++ = key;
+		key = kdb_read_handle_escape(buf, pbuf - buf);
+		if (key < 0) /* no escape sequence; return first character */
+			return buf[0];
+		if (key > 0)
+			return key;
 	}
-	return key;
+
+	unreachable();
 }
 
 /*
-- 
2.21.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
