Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B64811D7A77
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 18 May 2020 15:54:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jagDX-0007MW-Io
	for lists+kgdb-bugreport@lfdr.de; Mon, 18 May 2020 13:54:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <emil.l.velikov@gmail.com>) id 1jYzDP-0000KB-AJ
 for kgdb-bugreport@lists.sourceforge.net; Wed, 13 May 2020 21:46:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xXwPehQJdO8W/RRFT9lpEbo/rwg/NqlvrsX9ydy+gUY=; b=BtUne9B4uAX5jPE7zjbuVECU31
 CjOvwULyfd84ieUpJ9KiXBjRu/mCj30XcUW5AhYfZgfdOFF4XIASefgCAx0Zs38UPuaCt4KQhifFO
 5dCuZ6nQLmfjIWHqV8qLUnkyXD+yNqsT9IRYkJCfTm8xHIs/oKaunKfbR88CBFITzois=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xXwPehQJdO8W/RRFT9lpEbo/rwg/NqlvrsX9ydy+gUY=; b=JQCYl/fdmP4vuaRsxkJXlCLMos
 X6ZkLOANnt70iujeNHbynD+4wLiQVARh7Av6ZGkMbadtpRK1TQHmQP8hZRbyiOEqbO7eB3PTvsy3P
 B8U18u9ZrXK7AWwfsWNLPYFmhwBwsmBZUHXrVrClm6Ozc7Xal4itXF0bfItfCAHwd+s0=;
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jYzDJ-0063G9-Ee
 for kgdb-bugreport@lists.sourceforge.net; Wed, 13 May 2020 21:46:59 +0000
Received: by mail-wr1-f67.google.com with SMTP id i15so1283994wrx.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 13 May 2020 14:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xXwPehQJdO8W/RRFT9lpEbo/rwg/NqlvrsX9ydy+gUY=;
 b=rr+s2C7s3IetyBx7kdhC2xyGjmSTPhmqZhI5/PZ+FbS/2BORt8LIkjnLxdLspEASX0
 51sn7beVDeEo6rKv1MXsb0gx+hhHXvMtjVkSAXAscD3TvvRmb4hg/48XyNdRmyaAlqrx
 3HEH1yPjKSPvKuMRkSYDf4dG4oo0yAEmb0q6IFfTAFvN/fr9ekuEDG8UWgqUnxKtrxyk
 X17kJ375os2vhxJE6ezApRqMSgh8Yln4Zv5y8sltZTHJZaXqwrQDfpS+FMV1LSjKe/F7
 iymLY764L6GTLbeuBfI7gpkJRtxt42+ogtqXGM7bKsaGZj9xRX2EXol4NY+ywW8xCAON
 YbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xXwPehQJdO8W/RRFT9lpEbo/rwg/NqlvrsX9ydy+gUY=;
 b=S9jnbxI98UwFjqscbQupcMUZ+URySq8Lsaw+BN9RBQfjwpow2LSbtUi+xbnyil1shN
 rk0WelK/3uzQs5otTEgX3jBQ3xvpWQSwF3S7KNVGCWvkGU45rpC8NR0EyylYWl3z/t+Z
 5qbBRVpBzRedC5EesskLZxMz0mpJA6fQGUAn8V2vymrDDT6JmswrFiWgwwLVSXblKsCw
 YBKL/PNs0C34H8F3g4RtMDdUzOdiXy6LglhkC+++8VHJ88D9nHJVVLEyvfzbYVQzl7+h
 x/Dbzx+I1N5VVDfHmFT3Asv4W5m9U3HB6ZXdxV2woUBLJbgOG3IbMqjkNT9Sbfr5aC/F
 PILQ==
X-Gm-Message-State: AOAM531Z8HMnBcgggKMgMmzS1m6hMc8TH2HxM2QpOOMo87eJ6Fb32sC7
 uxRcZeBcFht+kFkAeb88MMQXZRQI
X-Google-Smtp-Source: ABdhPJw9XZ5u4qa2WDv17qZvd3SOounzZl47xyXJOSldxT3dsYn4CeJEqn0WOiupCTq6uTcy8reIZQ==
X-Received: by 2002:adf:e5c9:: with SMTP id a9mr1683725wrn.292.1589406407182; 
 Wed, 13 May 2020 14:46:47 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id m23sm1699734wmg.45.2020.05.13.14.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 14:46:46 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Date: Wed, 13 May 2020 22:43:49 +0100
Message-Id: <20200513214351.2138580-9-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
References: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (emil.l.velikov[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.67 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.67 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jYzDJ-0063G9-Ee
X-Mailman-Approved-At: Mon, 18 May 2020 13:54:05 +0000
Subject: [Kgdb-bugreport] [PATCH 09/11] kdb: constify sysrq_key_op
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>,
 emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

With earlier commits, the API no longer discards the const-ness of the
sysrq_key_op. As such we can add the notation.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>
Cc: linux-kernel@vger.kernel.org
Cc: Jason Wessel <jason.wessel@windriver.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: kgdb-bugreport@lists.sourceforge.net
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
Please keep me in the CC list, as I'm not subscribed to the list.

IMHO it would be better if this gets merged this via the tty tree.
---
 kernel/debug/debug_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 2b7c9b67931d..355bea54ca0e 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -920,7 +920,7 @@ static void sysrq_handle_dbg(int key)
 	kgdb_breakpoint();
 }
 
-static struct sysrq_key_op sysrq_dbg_op = {
+static const struct sysrq_key_op sysrq_dbg_op = {
 	.handler	= sysrq_handle_dbg,
 	.help_msg	= "debug(g)",
 	.action_msg	= "DEBUG",
-- 
2.25.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
