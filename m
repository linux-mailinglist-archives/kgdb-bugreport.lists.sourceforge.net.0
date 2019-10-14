Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AEAD666D
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 14 Oct 2019 17:46:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iK2Yc-0004u8-Rf
	for lists+kgdb-bugreport@lfdr.de; Mon, 14 Oct 2019 15:46:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1iK2YW-0004tQ-VP
 for kgdb-bugreport@lists.sourceforge.net; Mon, 14 Oct 2019 15:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1Av3ioNZKtn1IoIkmuPv2cbQ6HyfD+1rS28OweGIOdo=; b=W++Cg2pe76G5byEJsvCj3g+uvW
 xsGQieTNkM+2U5Ir0XCh2L2WBeUmp3upQ1myTpsF1K7v61rInlapfemfrsMmAh76u1jKBgFjCpDUp
 JrJQHem4/s1wcZ7yj/ASuivzcTIaytKPBSMo0X8/oXV6riPJTmUe36wdki0vM1m1Ny8g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1Av3ioNZKtn1IoIkmuPv2cbQ6HyfD+1rS28OweGIOdo=; b=eM3IjCJ/67ffXoHSd4+oYI3eV1
 qLfXnvxIGJwztwByIfNEh/CrcaK4UIZ2JOeKeqFa3VUhZwrCxVq/Rj7G7birJKks1hHw9X2tPUbk4
 MZaR45sK7KpPpIocbOXaXO9mOWL9bztLM55+9lflhrmMf4q3KQTfXNF/zSEB25sm9gE8=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iK2YV-000dHV-Cs
 for kgdb-bugreport@lists.sourceforge.net; Mon, 14 Oct 2019 15:46:44 +0000
Received: by mail-wr1-f68.google.com with SMTP id r5so20261643wrm.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 14 Oct 2019 08:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Av3ioNZKtn1IoIkmuPv2cbQ6HyfD+1rS28OweGIOdo=;
 b=YM1MA4Ug496qhJG5JvBKwtecmdfgxLvwt5inayWrP/lErf4KHykJ7C09zxlGL0sWGR
 0BnL+DDPzZ1Ou6v+pY6BgmI+BkfA78ismkjLcC6D2QSxNMhAOLEdIMUDYx5gQLr652V1
 uVl2mEp4TXv7sAqmay1F1z/HsX4N4Sr0bs6/d5bYPqBsaHPxgjSDzqufNnCbIUMpKGCp
 1ElUPBkbaWpiV8m2jBrqZCkeNk+J4bHJvy0gNwI/KQy3DQ6D+mmqKgIr+F1qwg6I9LOK
 9ddvnBHnmgIdnTjWTelfyj2NDxWX2akx+aLMXaYRmYL+10Vwxzpb0Y+5um9HeV4sSNYz
 hm/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Av3ioNZKtn1IoIkmuPv2cbQ6HyfD+1rS28OweGIOdo=;
 b=tbUQAPJYlwML0OMfMexr9Hviqu+6eZqMuVYTHFabVZBqfr3M9c/WbqBqSdKs/nBuXg
 oXv/MbYgNnErxujtqrFiFXydaW2dsHTVOvfA0+eqcZS/JrRwXxMO4PtAyksF/HTm9uTU
 7nfwM1D+Zcgq13bTJT6IwaGKcf6JPRGL6wS2yeHfrV6AW4urYVRgyCJfOz2Yo25fer2a
 mglngSqzvVfH92KDYoKN+8WK/l/MEUPbUf1d7ijlTwGwDjImslKYxpqF9TzRTdG/GcyZ
 cEyBFAjDQbnGRsyWxw2Q6Lt9yf3pQp3fKTJfWRopt8lYEj3VKPiCKWyaISG8fnp0XiOR
 WSUw==
X-Gm-Message-State: APjAAAVa6K10HCNwuamYVgmMaqY5UW6TMAdDZtfI6wwgdYu0aUK3Ifsz
 JT5E9VYmerHyz+OM4t02Cg3duw==
X-Google-Smtp-Source: APXvYqzYJrKpnk39yJydikl6aLQWQKXotCoJvyK9bK+1KGh5xXAPc24eb58KOqbLaiBk+LpAw9+nCQ==
X-Received: by 2002:a5d:5271:: with SMTP id l17mr27011147wrc.19.1571067996855; 
 Mon, 14 Oct 2019 08:46:36 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id q22sm16539738wmj.5.2019.10.14.08.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 08:46:36 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Mon, 14 Oct 2019 16:46:26 +0100
Message-Id: <20191014154626.351-6-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191014154626.351-1-daniel.thompson@linaro.org>
References: <20191014154626.351-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iK2YV-000dHV-Cs
Subject: [Kgdb-bugreport] [PATCH v3 5/5] kdb: Tweak escape handling for vi
 users
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

Currently if sequences such as "\ehelp\r" are delivered to the console then
the h gets eaten by the escape handling code. Since pressing escape
becomes something of a nervous twitch for vi users (and that escape doesn't
have much effect at a shell prompt) it is more helpful to emit the 'h' than
the '\e'.

We don't simply choose to emit the final character for all escape sequences
since that will do odd things for unsupported escape sequences (in
other words we retain the existing behaviour once we see '\e[').

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/kdb/kdb_io.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index f9839566c7d6..5e71bb2596ed 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -161,8 +161,8 @@ char kdb_getchar(void)
 
 		*pbuf++ = key;
 		key = kdb_handle_escape(buf, pbuf - buf);
-		if (key < 0) /* no escape sequence; return first character */
-			return buf[0];
+		if (key < 0) /* no escape sequence; return best character */
+			return buf[pbuf - buf == 2 ? 1 : 0];
 		if (key > 0)
 			return key;
 	}
-- 
2.21.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
