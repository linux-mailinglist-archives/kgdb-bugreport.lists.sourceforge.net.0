Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F934D2637
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  9 Mar 2022 04:30:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nRn2D-0006Jy-5Q
	for lists+kgdb-bugreport@lfdr.de; Wed, 09 Mar 2022 03:30:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rdunlap@infradead.org>) id 1nRn2B-0006Jk-HP
 for kgdb-bugreport@lists.sourceforge.net; Wed, 09 Mar 2022 03:30:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Aasby+93F3H3sQOG047CDVl/4vvrh2eNkazM7N8aBm0=; b=Ru05OyH0+cOj5I4gW4B+at3sKE
 +mF+uUnjryH/IHyLZRrmXrloAISvXRd9Z8m2iCKbEQpMcxHlLDeNRezLwX35riClPqgSuUifl3L9P
 zAl+SNFvqbd3PxNTzDZwAQAGdGEBGV8rgJy7V/kpAvkKcOx0YhnfEVOsOZ95hXvPhip0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Aasby+93F3H3sQOG047CDVl/4vvrh2eNkazM7N8aBm0=; b=R
 f+fcqihz1YkJeDiXrEDCgPCGcUISXu/vw9UFGRmk3DhSlSubX4s8stH1fa2XNwTeUfISUSagA7vAP
 WiAVSDuOFaLllLjJkqgY7XFZwbh2E1B7OUo6+DG/L67oZHWRXmWAkPKgfDNj7znfn2JVh7jixxQs9
 N25h4bH40kk/1Tcc=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nRn26-009ILA-Dz
 for kgdb-bugreport@lists.sourceforge.net; Wed, 09 Mar 2022 03:30:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Aasby+93F3H3sQOG047CDVl/4vvrh2eNkazM7N8aBm0=; b=ovJTpCHMUN9Ts6OvX59nTZgbXv
 wCbU6VlQTzM4coC5DrXJr5CHAVt0kl0Wjl1p4Iq+oAFnUGQ0yuoIFVjB1pziG2594VlA25Hx3dvNW
 qwNPnk45l6IhAZCoRy7RkzDLZElI3tChTSF6ZvNYUyP0A+kebn/3D6GHZEOGhbopMu/L/LHhAx6gR
 xyRg8ljtMMCjn1AxT/KSGpmfX7JXdJ/aVY3L/3qJZJUuQvK+YEeuemccx8jP9NvSo1tg2hgzM4vjf
 pkDUvgc337rzPGgzDTqHsIPSXw9hKOIqUdlva5/MUzUy0rJuDLj31wvqTXvpKEP9TknRK6GY7lVLR
 JZU8NPaw==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRn1n-0076Gm-Hk; Wed, 09 Mar 2022 03:30:19 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Tue,  8 Mar 2022 19:30:18 -0800
Message-Id: <20220309033018.17936-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: __setup() handlers should return 1 to obsolete_checksetup()
 in init/main.c to indicate that the boot option has been handled. A return
 of 0 causes the boot option/value to be listed as an Unknown kern [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nRn26-009ILA-Dz
Subject: [Kgdb-bugreport] [PATCH v2] kgdboc: fix return value of __setup
 handler
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, He Zhe <zhe.he@windriver.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Igor Zhbanov <i.zhbanov@omprussia.ru>,
 Jason Wessel <jason.wessel@windriver.com>, linux-serial@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

__setup() handlers should return 1 to obsolete_checksetup() in
init/main.c to indicate that the boot option has been handled.
A return of 0 causes the boot option/value to be listed as an Unknown
kernel parameter and added to init's (limited) environment strings.
So return 1 from kgdboc_option_setup().

Unknown kernel command line parameters "BOOT_IMAGE=/boot/bzImage-517rc7
  kgdboc=kbd kgdbts=", will be passed to user space.

 Run /sbin/init as init process
   with arguments:
     /sbin/init
   with environment:
     HOME=/
     TERM=linux
     BOOT_IMAGE=/boot/bzImage-517rc7
     kgdboc=kbd
     kgdbts=

Fixes: 1bd54d851f50 ("kgdboc: Passing ekgdboc to command line causes panic")
Fixes: f2d937f3bf00 ("consoles: polling support, kgdboc")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: Igor Zhbanov <i.zhbanov@omprussia.ru>
Link: lore.kernel.org/r/64644a2f-4a20-bab3-1e15-3b2cdd0defe3@omprussia.ru
Cc: He Zhe <zhe.he@windriver.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>
Cc: kgdb-bugreport@lists.sourceforge.net
Cc: Jason Wessel <jason.wessel@windriver.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: linux-serial@vger.kernel.org
---
v2- correct Fixes: tag(s) (thanks Doug)
  - drop Cc: Laura Abbott <labbott@redhat.com> (bouncing)
  - add a reference to init/main.c::obsolete_checksetup()

 drivers/tty/serial/kgdboc.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- lnx-517-rc7.orig/drivers/tty/serial/kgdboc.c
+++ lnx-517-rc7/drivers/tty/serial/kgdboc.c
@@ -403,16 +403,16 @@ static int kgdboc_option_setup(char *opt
 {
 	if (!opt) {
 		pr_err("config string not provided\n");
-		return -EINVAL;
+		return 1;
 	}
 
 	if (strlen(opt) >= MAX_CONFIG_LEN) {
 		pr_err("config string too long\n");
-		return -ENOSPC;
+		return 1;
 	}
 	strcpy(config, opt);
 
-	return 0;
+	return 1;
 }
 
 __setup("kgdboc=", kgdboc_option_setup);


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
