Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C261C9BB8
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  7 May 2020 22:09:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jWmpe-0000fX-O7
	for lists+kgdb-bugreport@lfdr.de; Thu, 07 May 2020 20:09:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jWmpc-0000f4-20
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 20:09:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+igHgzIqWZe6OT6gTK1ehvXj127NSNGPVn9Isn122A8=; b=G68eXpGxRmWAOPHuNKyJCt1h4G
 N3+xS61gUiwB83uTAiVRNRFB9MijnB1irmEGhQWDmYhU+B0kplF9iWpXkhzzQFZW8wEIIvgpwnEAJ
 ss7vR16bNPAZaActcAKnbT7uwvsSFbKgFqLlvIPVugi+4Mrl6k2sEvaSC5BEcDwBUKbY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+igHgzIqWZe6OT6gTK1ehvXj127NSNGPVn9Isn122A8=; b=M/9iy58BR92rkxfqzsJWnAx4qP
 iF/WKII897sIUSdw0NcaDXBPn34Xv85YNXI9oJW5zKKkc2K3Hg6sBU18GmPgIg3HPJAb+H38MlfKk
 YbkMYk6wwPKcUElKyhlOjbHcV9DVY4J3xZbeUZkySg/LZMxdhheKLtEYwLXO960pb0FQ=;
Received: from mail-pj1-f66.google.com ([209.85.216.66])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jWmpW-00EdST-V1
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 20:09:20 +0000
Received: by mail-pj1-f66.google.com with SMTP id h12so4215439pjz.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 07 May 2020 13:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+igHgzIqWZe6OT6gTK1ehvXj127NSNGPVn9Isn122A8=;
 b=XE5En1H+lpOUQAX8ckpo+HHEGAyxCAmUBvhkKbZMRLxQT47ProdK8zaHod/JbejEoB
 sXh/Tu/5AhbLKSQfHn96xpSNZhK++iWxZEmNf3n00E7bbkO7DqQS+C+GLh9i60S4xQ0m
 eWVJ5rkfjbi64nWZcUyAR1cMh0h46rlZb+HqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+igHgzIqWZe6OT6gTK1ehvXj127NSNGPVn9Isn122A8=;
 b=Nnd4gh3JF2HWTOTOZ56olbau5DJQdrBiDmE9e/1YbO6dGtnCqGCbnE6mLHyzOdsHhW
 D/pBhvW/hX/CkzV8lopJM+jN7a8nxpZasE8A3l7/tfdkHrzibZ8AJOFtUVZJx9NH0Z2q
 u5r0FZMyZPWDQQQAFmLEshyQV10WKXR8u5pmL6bWmqnPvH3vr3hZE6V24kPhchuhq/tx
 +vGM/ZioQ2jIZlDbWkgBAJDwTfDp3VEnJCBMRS6WTnuRYi9e/o6aH/7ZhFLd32Z1gsQE
 HQzg8ZmLC87A48JXNtvIdmCTo+tlgzUTUhQd9/7GXzaeCEX1qVX8VYS16UXuqRkuaPbR
 m+rg==
X-Gm-Message-State: AGi0PuZtWJ5rTMGkwA1MHmXMlXEVpnF10JuvPQp9tZWR5PitAUycWeY9
 0j8BwROJK0SOQoK9Tm5wCT50FQ==
X-Google-Smtp-Source: APiQypL0biztyRxmF7Lwtt+4aWp6foHRtH/yfwnzRkceu6JjnF1a0fFW6TVpNoKxLoUIWIM9V/3cuQ==
X-Received: by 2002:a17:902:7596:: with SMTP id
 j22mr14310656pll.226.1588882149206; 
 Thu, 07 May 2020 13:09:09 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id d203sm5547601pfd.79.2020.05.07.13.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 13:09:08 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 gregkh@linuxfoundation.org
Date: Thu,  7 May 2020 13:08:45 -0700
Message-Id: <20200507130644.v4.7.Icb528f03d0026d957e60f537aa711ada6fd219dc@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
In-Reply-To: <20200507200850.60646-1-dianders@chromium.org>
References: <20200507200850.60646-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.66 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.66 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWmpW-00EdST-V1
Subject: [Kgdb-bugreport] [PATCH v4 07/12] kgdboc: Remove useless #ifdef
 CONFIG_KGDB_SERIAL_CONSOLE in kgdboc
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
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
 kgdb-bugreport@lists.sourceforge.net, jslaby@suse.com, agross@kernel.org,
 bjorn.andersson@linaro.org, mingo@redhat.com, bp@alien8.de,
 linux-serial@vger.kernel.org, hpa@zytor.com, tglx@linutronix.de,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

This file is only ever compiled if that config is on since the
Makefile says:

  obj-$(CONFIG_KGDB_SERIAL_CONSOLE) += kgdboc.o

Let's get rid of the useless #ifdef.

Reported-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- ("kgdboc: Remove useless #ifdef...") new for v4.

Changes in v3: None
Changes in v2: None

 drivers/tty/serial/kgdboc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index 519d8cfbfbed..2e9158fff976 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -380,7 +380,6 @@ static struct kgdb_io kgdboc_io_ops = {
 	.post_exception		= kgdboc_post_exp_handler,
 };
 
-#ifdef CONFIG_KGDB_SERIAL_CONSOLE
 static int kgdboc_option_setup(char *opt)
 {
 	if (!opt) {
@@ -409,7 +408,6 @@ static int __init kgdboc_early_init(char *opt)
 }
 
 early_param("ekgdboc", kgdboc_early_init);
-#endif /* CONFIG_KGDB_SERIAL_CONSOLE */
 
 module_init(init_kgdboc);
 module_exit(exit_kgdboc);
-- 
2.26.2.645.ge9eca65c58-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
