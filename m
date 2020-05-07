Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC84C1C9BB7
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  7 May 2020 22:09:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jWmpb-0000en-Mb
	for lists+kgdb-bugreport@lfdr.de; Thu, 07 May 2020 20:09:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jWmpZ-0000eW-Lq
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 20:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c/DsRm4g6gIbDNrt7b5XJT8F2ZdnzG78OB1C4FcIZRg=; b=aucR3qkUXVqSDwkw3pUzvhTlau
 YRQOQ6zEI4BLE0Cas7c9bqdFlrnUgBwPZ3o70ARFE1KkHB2uQZ8JJaiSgR2c4UCsG2A7oNN2tXD7B
 fGoMQDgONP1sgElPfDTKHP52j0yxM7MsBqnrd4LEDPUlyTuHJ308uzf3Whbl7s0jziBk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c/DsRm4g6gIbDNrt7b5XJT8F2ZdnzG78OB1C4FcIZRg=; b=BsoeKeZIddHljfsrRHr1cpZw3H
 573HaYYGIix5VgC1bYDzKuI+a+xV0QaewICAUa6q9HXwjmPbU2usH6sXlsoEj8yaVT3jkCY1lFJIr
 6gGi7nreUUhzoAgM5ZMqoW1Lt7PTkkgDkrpymeVv8OGFTSS/zN6pOHmDZ8qancC+SFQY=;
Received: from mail-pf1-f193.google.com ([209.85.210.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jWmpX-000hUQ-HN
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 20:09:17 +0000
Received: by mail-pf1-f193.google.com with SMTP id x15so3553292pfa.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 07 May 2020 13:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c/DsRm4g6gIbDNrt7b5XJT8F2ZdnzG78OB1C4FcIZRg=;
 b=Wji61SIerY4A7CIjkXjeQbrgHiPO+IPz799kwT2t+CDnNp3fyN1ul6dEyGHysTzfpC
 JZo5ah0CiyK9u/ZGlwjIyCE/GpmxmmZIYPu0KXJO2nZfLuj433mngzH/hie8b0wDBddz
 NnCipZ1Khy+kmgpi29vWHoHozWaVMNYziA4dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c/DsRm4g6gIbDNrt7b5XJT8F2ZdnzG78OB1C4FcIZRg=;
 b=mJMAAQqIXnkymsNsjat/U4LlBJVM3xUJS2CTo0w+2AY+39SGnhg+xrDsfa5/TYtX2R
 IJMNE3VrIV7XPHmfnn8+5DDTlDUZJYJ3uT5fb9DOMViRYSXQFHlZtpphrB1Q2zgis7ZI
 JT7Y6aDG7GrMprV15BfUyiHauZ0CxD1kqWtZZCoBikEdj26hczQtKl9QlRXGhdxRKory
 JguocNctpP9cMq1HVZwWFc1cGVqE44OcNNmOyh6sj+8Ie0f4je7DWu3NEoVDRqYB5QTX
 1fTWH5IHfQSOL9s8QpYiHFTecCqsibdB/lbOgh88cfuFGQw2U9R3xGcBWT6PMEwQaHAm
 uPRA==
X-Gm-Message-State: AGi0Puaw0+rPP3HuSKDiyyaS0JuAaKH6Ff0cbSfmnitr/EHyMvrNh/+d
 auxeuksw1je82KzU+y+ROYzfcw==
X-Google-Smtp-Source: APiQypICIyZYq+Lw5KlpKjR4sb4ChoSHP4P4KSBPQc5p5Oha2jBsP7gH0oqRg+pBV+ShiYgjJnWVXQ==
X-Received: by 2002:a63:200b:: with SMTP id g11mr1896922pgg.22.1588882142461; 
 Thu, 07 May 2020 13:09:02 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id d203sm5547601pfd.79.2020.05.07.13.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 13:09:01 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 gregkh@linuxfoundation.org
Date: Thu,  7 May 2020 13:08:40 -0700
Message-Id: <20200507130644.v4.2.I02258eee1497e55bcbe8dc477de90369c7c7c2c5@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
In-Reply-To: <20200507200850.60646-1-dianders@chromium.org>
References: <20200507200850.60646-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.193 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.193 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWmpX-000hUQ-HN
Subject: [Kgdb-bugreport] [PATCH v4 02/12] Revert "kgdboc: disable the
 console lock when in kgdb"
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

This reverts commit 81eaadcae81b4c1bf01649a3053d1f54e2d81cf1.

Commit 81eaadcae81b ("kgdboc: disable the console lock when in kgdb")
is no longer needed now that we have the patch ("kgdb: Disable
WARN_CONSOLE_UNLOCKED for all kgdb").  Revert it.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---

Changes in v4: None
Changes in v3: None
Changes in v2:
- ("Revert "kgdboc: disable the console lock when in kgdb"") new for v2.

 drivers/tty/serial/kgdboc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index c9f94fa82be4..8a1a4d1b6768 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -275,14 +275,10 @@ static void kgdboc_pre_exp_handler(void)
 	/* Increment the module count when the debugger is active */
 	if (!kgdb_connected)
 		try_module_get(THIS_MODULE);
-
-	atomic_inc(&ignore_console_lock_warning);
 }
 
 static void kgdboc_post_exp_handler(void)
 {
-	atomic_dec(&ignore_console_lock_warning);
-
 	/* decrement the module count when the debugger detaches */
 	if (!kgdb_connected)
 		module_put(THIS_MODULE);
-- 
2.26.2.645.ge9eca65c58-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
