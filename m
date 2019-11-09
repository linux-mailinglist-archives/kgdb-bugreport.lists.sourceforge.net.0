Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 381CEF6137
	for <lists+kgdb-bugreport@lfdr.de>; Sat,  9 Nov 2019 20:43:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iTWdb-0005Ur-0v
	for lists+kgdb-bugreport@lfdr.de; Sat, 09 Nov 2019 19:43:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iTWdZ-0005Uk-Ss
 for kgdb-bugreport@lists.sourceforge.net; Sat, 09 Nov 2019 19:43:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TMGL0/JOFpPqKkGlrsxqclkHeaNLkWbgoH9TNGWPKSw=; b=bB/V3imHfk3CHhYE9cL6TctvBp
 7EbggYot7R+0DiwKIZiwZDPd9VX2EGQovGWbSmjquNxiVbt8LY8LoEMmZQvLRCkYUmeH6mPM7uFKJ
 98/IhNypQmPaHT7ooSsbjrhX+G5864AojurHeYQWIhN9iW2/ph4t4NHuRjAxSp/dGtXs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TMGL0/JOFpPqKkGlrsxqclkHeaNLkWbgoH9TNGWPKSw=; b=R1vGmahzVAVAAhT3bDiRFqHFwX
 4wdM41f7xE39f4Wj4YGmtcig1Hz6mahtoCB9ts+Ad7viq9PLY3za8ll+XJRnMrxlG/ktBmJca7WGS
 iFCaonjy8XIXZ6JM7WHQm4WS94ur02FdlJoyP13uKod4WrmLImzI6tASZr4PMWXsGf4A=;
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iTWdY-009qVP-0M
 for kgdb-bugreport@lists.sourceforge.net; Sat, 09 Nov 2019 19:43:09 +0000
Received: by mail-io1-f65.google.com with SMTP id x21so9993890iol.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sat, 09 Nov 2019 11:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TMGL0/JOFpPqKkGlrsxqclkHeaNLkWbgoH9TNGWPKSw=;
 b=lkiCealdzclaVAPsevr74tOpi5JiABXIsPgU1ZVyWip88uN0+FOgeLeKvj1vc4lJJ9
 FT0x0EoErJL5QQFJC5uWygVLO7Sex5+OJk+TbBSgzROcaOM9R/NSkTexwy+x9ekor8mP
 egLHNr2ujeun+0/0VYIG8MRz1J0x379phIBME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TMGL0/JOFpPqKkGlrsxqclkHeaNLkWbgoH9TNGWPKSw=;
 b=TjVQropPCe6GI5gcrbgTVS/39eJXUncde5PVuaKanQZxBsoeP+fL06U2OBE9AFqFHP
 M8wz7GG4weRb0yMNjSQ6Uo+hBs09vdv9cnAzHFhyXWAWtFe/uj5K+hhfb7vV6XBS1pEY
 GaXEXxcoCupinsv3sTmk+8TBxe3Lv6Uu9i1M0Hs79ZJgSnpiYxbLGMd2WLWMQMXuG31s
 nptsKwoDVhfkkJIvEWnh0YJrT7kdMyaWDK4YiCtKFJ+2DeNJBIxQL2GdsAy50hgofhnx
 V9BSFr5jxegqRoEFQCUKLjuQ7XjOkt975xQXEVeDRMxSiXN+941hZMNZHJ4crhzlHTD+
 Onyw==
X-Gm-Message-State: APjAAAUys7AOOIeLOmnKSM74d/DVq5NbS6R1eJMcjFuTajhOpxlMffrh
 p7NOzjT2cUyM/twG1UglI7NpPSGsFvI=
X-Google-Smtp-Source: APXvYqxnQkGYhPWPn3X9DGYKlVL1PWVPD0psI26vKilAG8d5p0YT0qXbyIrrGS21pCS3WIFLhz/pnA==
X-Received: by 2002:a63:e84d:: with SMTP id a13mr19382177pgk.226.1573327069085; 
 Sat, 09 Nov 2019 11:17:49 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id i11sm9193577pgd.7.2019.11.09.11.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2019 11:17:48 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Paul Burton <paul.burton@mips.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>
Date: Sat,  9 Nov 2019 11:16:40 -0800
Message-Id: <20191109111623.1.I30a0cac4d9880040c8d41495bd9a567fe3e24989@changeid>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
In-Reply-To: <20191109191644.191766-1-dianders@chromium.org>
References: <20191109191644.191766-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iTWdY-009qVP-0M
Subject: [Kgdb-bugreport] [PATCH 1/5] MIPS: kdb: Remove old workaround for
 backtracing on other CPUs
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
Cc: qiaochong@loongson.cn, kgdb-bugreport@lists.sourceforge.net,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, ralf@linux-mips.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, James Hogan <jhogan@kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

As of commit 2277b492582d ("kdb: Fix stack crawling on 'running' CPUs
that aren't the master") we no longer need any special case for doing
stack dumps on CPUs that are not the kdb master.  Let's remove.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I have no way to test this personally, so hopefully someone who uses
kdb/kgdb on MIPS can.

Ideally this patch should be Acked by MIPS folks and then land through
the kdb/kgdb tree since the next patch in the series, ("kdb:
kdb_current_regs should be private") depends on it.

 arch/mips/kernel/traps.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 342e41de9d64..46fbcfeaae9a 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -210,11 +210,6 @@ void show_stack(struct task_struct *task, unsigned long *sp)
 			regs.regs[29] = task->thread.reg29;
 			regs.regs[31] = 0;
 			regs.cp0_epc = task->thread.reg31;
-#ifdef CONFIG_KGDB_KDB
-		} else if (atomic_read(&kgdb_active) != -1 &&
-			   kdb_current_regs) {
-			memcpy(&regs, kdb_current_regs, sizeof(regs));
-#endif /* CONFIG_KGDB_KDB */
 		} else {
 			prepare_frametrace(&regs);
 		}
-- 
2.24.0.432.g9d3f5f5b63-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
