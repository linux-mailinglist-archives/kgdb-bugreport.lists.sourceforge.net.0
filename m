Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 44632222135
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Jul 2020 13:17:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jw1sr-0003MB-2m
	for lists+kgdb-bugreport@lfdr.de; Thu, 16 Jul 2020 11:17:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <keescook@chromium.org>) id 1jvuGa-0003s3-7n
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 03:09:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PQ3rS81iCqlQj563UE75aUsx51oFdKIvno+SEEG/FG4=; b=BTkUcEB0aQ5N3MN3nStzpGrbxG
 jjPf4fovWjAURcKtIKkkdkjPjpK4yiCxMf578Iw18U2kijXe0Pc4JP0ye2n2Dy2DBs6yqJc0/L/DH
 K8g++TxN4Q01QVnMX7xoePDgVskltKHdT0kqvtu/dRgDqmOqn93sV1ckQ1q6wyJDxhek=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PQ3rS81iCqlQj563UE75aUsx51oFdKIvno+SEEG/FG4=; b=AC3EeN30KaT0S997qGWEpaBe3Q
 UPeLlPrwFDJHbEAVkMGmnLHPN1ePgiKs3O6IgDmYPllq3annDP992RrNvuiB4rDE/KFy15oIrd1dY
 hoQlfGNjvWj9w1eJ3ijIWyY0pRjNMNaPWby2VpYhjztFy38sIYd1T9/dk6FJ7rknfBYM=;
Received: from mail-pl1-f194.google.com ([209.85.214.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jvuGZ-009cTq-11
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 03:09:00 +0000
Received: by mail-pl1-f194.google.com with SMTP id w17so3237739ply.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 15 Jul 2020 20:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PQ3rS81iCqlQj563UE75aUsx51oFdKIvno+SEEG/FG4=;
 b=FG/kfdhrrvpgKNO8XoFAw8rMldsyko1xxMQvI4cYzTokOwgJ4VoV67Xp7ZSUwQyuB1
 pUGFqZBMP6lpP24GnUWphnxjAPTHxBvHDhawoWy2aIc23UsRgkac0gYVUKAPjXZwMzVH
 C32IKdA7MiHJNt49J80WqSESe08lPvA2ln4BQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PQ3rS81iCqlQj563UE75aUsx51oFdKIvno+SEEG/FG4=;
 b=a9VMfjtqOJj0rFW8BSZtBd3T94Ryzb2D/hnj6adR2Pzw9UCbYk3xXTQ2w5cvQb+8Bj
 fmzZy7W9tgWGG1vW9ZPBFpJaEY5m/P2s3PVKNVa4cdUtuJ8HPeuAtpL/Z/iMf25BPO39
 GshPSQ/ScWTS50VxWLsZj3CN+xQzlS0L6MAOHUHYjfjX5OjmFBmRcTfG1QImRjYUP1zo
 RmkA1+5ZABPuGI2SgZyIn1WDq/jBu5BxBy0WHVjL2Q6Y+SUHITZFo9kb0QBVafXXJvKd
 thCdzF90Yfi8IeO6TAluYsKr9NHLZ/znZJDNY+TTerhUM6oc8V6a4P4aOstpI7Ik9oGV
 bHZg==
X-Gm-Message-State: AOAM531XpZznuse3ZZ+MSPTdySgvd2LG2qwcm6TaGZKn/TWjog2GWwsm
 H+u8pWQSZVwOA8/bGrev8BHcEQ==
X-Google-Smtp-Source: ABdhPJyQqOXVFa0AWxv/APlQyrdA+w7DqHfNJLE5LIIILIY1tjbP6/hW3QXi5M1V5H9nUHof0O9/lw==
X-Received: by 2002:a17:902:6181:: with SMTP id
 u1mr1929724plj.205.1594868933459; 
 Wed, 15 Jul 2020 20:08:53 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id q20sm3015469pfn.111.2020.07.15.20.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 20:08:51 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 15 Jul 2020 20:08:45 -0700
Message-Id: <20200716030847.1564131-2-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200716030847.1564131-1-keescook@chromium.org>
References: <20200716030847.1564131-1-keescook@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.194 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jvuGZ-009cTq-11
X-Mailman-Approved-At: Thu, 16 Jul 2020 11:16:59 +0000
Subject: [Kgdb-bugreport] [PATCH 1/3] usb: gadget: udc: Avoid tasklet
 passing a global
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
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Oscar Carter <oscar.carter@gmx.com>, Mitchell Blank Jr <mitch@sfgoth.com>,
 kernel-hardening@lists.openwall.com, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, alsa-devel@alsa-project.org,
 Allen Pais <allen.lkml@gmail.com>,
 Christian Gromm <christian.gromm@microchip.com>, Will Deacon <will@kernel.org>,
 devel@driverdev.osuosl.org, Jonathan Corbet <corbet@lwn.net>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Julian Wiedmann <jwi@linux.ibm.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Nishka Dasgupta <nishkadg.linux@gmail.com>, Jiri Slaby <jslaby@suse.com>,
 Jakub Kicinski <kuba@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Wambui Karuga <wambui.karugax@gmail.com>, Kees Cook <keescook@chromium.org>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-input@vger.kernel.org, Ursula Braun <ubraun@linux.ibm.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jaroslav Kysela <perex@perex.cz>,
 Felipe Balbi <balbi@kernel.org>, Kyungtae Kim <kt0755@gmail.com>,
 netdev@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Kevin Curtis <kevin.curtis@farsite.co.uk>, linux-usb@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 Romain Perier <romain.perier@gmail.com>, Karsten Graul <kgraul@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

There's no reason for the tasklet callback to set an argument since it
always uses a global. Instead, use the global directly, in preparation
for converting the tasklet subsystem to modern callback conventions.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/usb/gadget/udc/snps_udc_core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/snps_udc_core.c b/drivers/usb/gadget/udc/snps_udc_core.c
index 3fcded31405a..afdd28f332ce 100644
--- a/drivers/usb/gadget/udc/snps_udc_core.c
+++ b/drivers/usb/gadget/udc/snps_udc_core.c
@@ -96,9 +96,7 @@ static int stop_pollstall_timer;
 static DECLARE_COMPLETION(on_pollstall_exit);
 
 /* tasklet for usb disconnect */
-static DECLARE_TASKLET(disconnect_tasklet, udc_tasklet_disconnect,
-		(unsigned long) &udc);
-
+static DECLARE_TASKLET(disconnect_tasklet, udc_tasklet_disconnect, 0);
 
 /* endpoint names used for print */
 static const char ep0_string[] = "ep0in";
@@ -1661,7 +1659,7 @@ static void usb_disconnect(struct udc *dev)
 /* Tasklet for disconnect to be outside of interrupt context */
 static void udc_tasklet_disconnect(unsigned long par)
 {
-	struct udc *dev = (struct udc *)(*((struct udc **) par));
+	struct udc *dev = udc;
 	u32 tmp;
 
 	DBG(dev, "Tasklet disconnect\n");
-- 
2.25.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
