Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9E0CFB85
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  8 Oct 2019 15:45:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iHpnm-0007pn-JP
	for lists+kgdb-bugreport@lfdr.de; Tue, 08 Oct 2019 13:45:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1iHpnl-0007pg-MD
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Oct 2019 13:45:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4kY29G0Vv0LUgp77TY4nev0SFuE29dpeYRm9kekwuAs=; b=ktQpVgZ4iLV73s+wh1qIBSMgTN
 5vuYJSCnI6a5jrVL4BXLWuLirV68YbgZutp2xiJWgd6MqJkaXnRNs2XWHUeXF94Qm/dL6YLA4KJwB
 liqqDdx6ERq6osXAZr/9J2KJrVoiM0J0jZVUum+Ga1haLrTIUh+/eeTey5GEz0mP8uVA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4kY29G0Vv0LUgp77TY4nev0SFuE29dpeYRm9kekwuAs=; b=NVc1k/ZZL+pZ9V9wG1DfWYMZ5C
 3A6C5FDkUNAS5rs7vEtvEnN9uSm1F82CrfKUJzVRP8DYlIz4BMUhvX4nfhwendb6scr96sF42jY1H
 4nFuanPsY33+EEpurP5tlY7Z11n8NysOrdj6U8srOaj0gqq57nabI3xMaXnm/FXAD9TQ=;
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iHpni-009ytb-NF
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Oct 2019 13:45:21 +0000
Received: by mail-wr1-f65.google.com with SMTP id r3so19516618wrj.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 08 Oct 2019 06:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4kY29G0Vv0LUgp77TY4nev0SFuE29dpeYRm9kekwuAs=;
 b=y8G5bARZUMAphF+R/07LfBMyRQOM3WLFLZtB1WmAPqNPLZIXJUU3T+n8svaRVbVXXu
 fSX0iRlglv3HdI9U7Q0BG/VcvMgxpjLBtlcMUoDlKX06EOjfoI1Yy8KUHuOqyo2WjWP3
 1BlNGvTlBgy1WaIf/OMofwgZxax85EDM4giKt1zHyXq8VvaKWpNU8TCcjlngahA/3rTG
 S6474/ShvWl1Qkw5H2YS++NelF3P9nlTN39EfmLrVTqDDDQvTHEXoXxFWPU8oc323mrS
 0rCULt0aSfd+5qQPPs2jb+P37REdOfPhBv4VM663cw+IxpEopgie9YBNUsxqMIiyf766
 b4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4kY29G0Vv0LUgp77TY4nev0SFuE29dpeYRm9kekwuAs=;
 b=iqRPBCkrfax14G25IZCkfyxnGk0tHv15t3RKZ7rkY93OY2iOM7yG+ge8gYY+rtAcv6
 9Wf4r7h3h9z20gzDPkfM4oCfzeoCZf/WTai4U8s57hNkpruIYeXVJjBwnMQSPhtRPNww
 iFrtykWYJz6sxxJd/P0Kl4ISuLJ/Qb9tWSZ991AAt5dZJmQfeR5iw6n2b9mPN4zSR30Y
 KjLIVDSY4wxA4I1w5SLZNv8dIn8JGJXZ3B9WN6wXNAlChg54BYNliurLeVivBX0V1HOA
 mifAtWZoiXBXQV8m17lweefGUOALqORLncszKJ6bHOZiTEDixEQIUSjc+IQUwk/nAItm
 atiw==
X-Gm-Message-State: APjAAAVkGs2+kqQMUmZLEK70UvYoB4HMXh2PJbssUXJVhoqpX668PmHt
 ccr4vOHm4QaFyVQZCgHU79HgzHFWEWm1dA==
X-Google-Smtp-Source: APXvYqxNmkd7+lu3m5HT68bq8+K8jXZJIhwyxO8fds7XHqED0zcAr0wrmRONAo9NJoIqfRGy4qAdMA==
X-Received: by 2002:adf:f684:: with SMTP id v4mr24398220wrp.155.1570540865110; 
 Tue, 08 Oct 2019 06:21:05 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id t8sm18237214wrx.76.2019.10.08.06.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 06:21:04 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Tue,  8 Oct 2019 14:20:43 +0100
Message-Id: <20191008132043.7966-6-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191008132043.7966-1-daniel.thompson@linaro.org>
References: <20191008132043.7966-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iHpni-009ytb-NF
Subject: [Kgdb-bugreport] [PATCH v2 5/5] kdb: Tweak escape handling for vi
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
index 288dd1babf90..b3fb88b1ee34 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -158,8 +158,8 @@ static int kdb_getchar(void)
 
 		*pbuf++ = key;
 		key = kdb_read_handle_escape(buf, pbuf - buf);
-		if (key < 0) /* no escape sequence; return first character */
-			return buf[0];
+		if (key < 0) /* no escape sequence; return best character */
+			return buf[pbuf - buf != 2 ? 0 : 1];
 		if (key > 0)
 			return key;
 	}
-- 
2.21.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
