Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF6BE448C
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 25 Oct 2019 09:34:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iNu6k-0004UX-QW
	for lists+kgdb-bugreport@lfdr.de; Fri, 25 Oct 2019 07:34:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1iNu6i-0004UD-1i
 for kgdb-bugreport@lists.sourceforge.net; Fri, 25 Oct 2019 07:34:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q37OwpiVtbI5u9x13AdojV2Y5xWX2cctv9qNpKud8OE=; b=ljtUMacy5DPgY871MwVAlDbK/7
 9G7yZa1e0JBQYlVMbC5Zz0DN9DRvL/o1YREv3L4SjVwfBrf3qO+t2LrztSjAXAF5sNnY/3/tc7zLe
 fJIAFU8l47w1knisXiHhXDrbep7Opf6QlV2Wod2O7jBc1E7QiePz1UAX2ibhyZ1xe/hk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q37OwpiVtbI5u9x13AdojV2Y5xWX2cctv9qNpKud8OE=; b=PY6/M9A9BfAtZQMfBZWe8C+WcY
 fi3YxZU2iBki3SmV9PHINuZfQ9dzbyVD0P3aDgz4bD50R9EnlvFI1dFQCAudyXXUH5XBVrnvzsLax
 dBnnpRdir97VEAp+xatLlRadqArFZG37iARunSwWLskZTdsWVlxBdBT26OdTXNZIG2eI=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iNu6d-0032rf-F7
 for kgdb-bugreport@lists.sourceforge.net; Fri, 25 Oct 2019 07:34:00 +0000
Received: by mail-wr1-f68.google.com with SMTP id s1so1117253wro.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 25 Oct 2019 00:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q37OwpiVtbI5u9x13AdojV2Y5xWX2cctv9qNpKud8OE=;
 b=P4LngvYmSq6jPBLO+72WALO/I5hwPb8wBo/iX++QaE/PGzClMjrelf5trymgeACiL/
 YTUcpEXbRYV250IAVK0n1KrbZZ2vDTGOOZ/DFhC10ZjdmHu4t+mfdEEAc8U3RLQOgvpf
 eTDeWOTe5ETiE4h/Srpkwxp763K0Vjr6b/J51TJzPuHZr1ZBOS3B+hi4ZzCV/MgcQBm1
 9Zwm79mjbRVCsi3HBCz5KRqA8fTXJ/NieqY03Zso65gOZJQOeLFaPj7Cmbc+szocGMSD
 vab+i02s06FO9zY9qYJ2h2W8lCbMo7HLapAZFtjGnfqUuNJYuDVfs+KKClYXNEudclg9
 7rRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q37OwpiVtbI5u9x13AdojV2Y5xWX2cctv9qNpKud8OE=;
 b=PNdTahVnKD1qnWwOA2PI+qR1X0Oy6xFpTFZB/YicY4/v2SkNTAdv8V42B/poDR0nSI
 gWPbRmBwIrQL7WEdT2jRnhPp5KWTbX8ef7cZ0OkC5DsU2yGcVHz6O/BHtN7SnKSGVN9P
 XrXtCFQGMH0G03uMrTzdN/FXk9bP/WYVleOwG1pCH7zFKZB2c4MlCAABu8PDBFJJ+W/X
 wgoRMLcBkT4l6lh8Y/RpbIMt2tN6l4GWNd9QEts85oCg2x8EmLv7Uy5409eFideb4pmZ
 kdeVxFMP3tAVurs1WZDJZZqhwXHu8kXeolCSfrWZcw9/i98x0Mn9ArCW+2Jk8AH0QjF5
 kMZA==
X-Gm-Message-State: APjAAAUu2X6JGYQKAWgc8rMHpYdqn1xgP4vJQwV/krgZhvj8nPy5BHUm
 yBfP5SV8ijD1FKnQucXcAE+nIg==
X-Google-Smtp-Source: APXvYqxVdg6EGKxAbF8m2sxB498qF0UJFQZ60UmPuvIvhtWcaHsRZj1iamepXusCBxdTqf7khttU6Q==
X-Received: by 2002:adf:c402:: with SMTP id v2mr1570013wrf.323.1571988828803; 
 Fri, 25 Oct 2019 00:33:48 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id a11sm1586602wmh.40.2019.10.25.00.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 00:33:47 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>
Date: Fri, 25 Oct 2019 08:33:28 +0100
Message-Id: <20191025073328.643-6-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025073328.643-1-daniel.thompson@linaro.org>
References: <20191025073328.643-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iNu6d-0032rf-F7
Subject: [Kgdb-bugreport] [PATCH v4 5/5] kdb: Tweak escape handling for vi
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
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 kernel/debug/kdb/kdb_io.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index f794c0ca4557..8bcdded5d61f 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -163,8 +163,8 @@ char kdb_getchar(void)
 
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
