Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8941C9BB2
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  7 May 2020 22:09:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jWmpX-0007yX-Ji
	for lists+kgdb-bugreport@lfdr.de; Thu, 07 May 2020 20:09:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jWmpW-0007yK-7X
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 20:09:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cED6NDO4Kxls/KrnV6UJCllmK01DyycDxaWWk+2LKjw=; b=ZUIOTIat58yx0OTlHq/9EUQY/8
 2esdUU8KVk18JFUgmn+qkgAP/iwk/vD3x2DoOimsrDw05uQWXjCEHOovYav0c579+jGecJyrhR6yD
 k8aMnJ5AtDpBHrvPu3dLRLZlKej4AtTrRkfOv8+8mDs3Hi717atsCIhcs8KZCTlclGQ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cED6NDO4Kxls/KrnV6UJCllmK01DyycDxaWWk+2LKjw=; b=LrzatHtqXP8OAyo2po9C4VmaZ2
 9gfNN7Cm2QPs4J0SwL8LfJT6TUjCvA2V1VVnVMDF45Yw3SsZXsbrlcuAp70i2el9mVbZ5hczNWy2Z
 /CReOa/Iyu9fQriwDisQx/T7uZ3/Gl8Ecy6VG0FwFG5CF0FEJXAzGXzKf0XUi1nwQkAM=;
Received: from mail-pj1-f66.google.com ([209.85.216.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jWmpU-000hUC-S3
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 20:09:14 +0000
Received: by mail-pj1-f66.google.com with SMTP id h12so4215407pjz.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 07 May 2020 13:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cED6NDO4Kxls/KrnV6UJCllmK01DyycDxaWWk+2LKjw=;
 b=oGL2HmBjVpDLGAerPqZz5QWfbBmc6h4NYbJ+HPzp2t89q2jx0vM/u3t8eVesy/Kp/i
 c6jIzQyF5Xt3oUA9KKLyvj4PI1/KF3EWjdAl8k/oJnQ9h3m6Y+2sBbN/hiJm7zpjHRd+
 M3GAlPq6ArCpj5RzA2ZcdESD+Zbesy1vwzmP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cED6NDO4Kxls/KrnV6UJCllmK01DyycDxaWWk+2LKjw=;
 b=q/ptQi2lEewdbee4MLRyF6P2xBXEHx4exiAK8vt3/IQozrRO2YjAL5ngj+9JarQXwB
 02ME+pHtRbYwjPjB9kwCHx4Golpvlfu/zLMcVmrUT5pSElgYsp/DZOCG0CYoKVkne07r
 IJKmtdmoHvPEjKyYrW3gHD21NEDbWHf/ydD9bufmcNlhtKBmvdz5DzKIheyDwwjXqwVI
 C18p3gmrnYJp8NuekK+e7YMNLRd2l/Dytc1hnApMLV65J7YfQTHMzx3MzsxGWL/gnyL0
 C3MFBaZ3ubl5Ah2CB+FjP9MFSQ6KYjT3ac2aGE9TvFX0Fbu89y3hdtceaPpLKj955Q9x
 uP8g==
X-Gm-Message-State: AGi0PuYatVjxkaTsMICzNLHQJE2D2dcu4OraM2NR5l7FuMRyMvFFMqxX
 kd+BhtTF5BrSestg74P3eJQ21g==
X-Google-Smtp-Source: APiQypKpAqCp8XOc/MLMZN0fgX43ORq5W22WL3D4XMRDrYPdkpsKqwzrWH7JlpnFrGUTMIhRBkHrmg==
X-Received: by 2002:a17:90b:a8e:: with SMTP id
 bn14mr2009217pjb.197.1588882146670; 
 Thu, 07 May 2020 13:09:06 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id d203sm5547601pfd.79.2020.05.07.13.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 13:09:06 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 gregkh@linuxfoundation.org
Date: Thu,  7 May 2020 13:08:43 -0700
Message-Id: <20200507130644.v4.5.I22067ad43e77ddfd4b64c2d49030628480f9e8d9@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
In-Reply-To: <20200507200850.60646-1-dianders@chromium.org>
References: <20200507200850.60646-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.66 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWmpU-000hUC-S3
Subject: [Kgdb-bugreport] [PATCH v4 05/12] arm64: Add call_break_hook() to
 early_brk64() for early kgdb
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
Cc: Mark Rutland <mark.rutland@arm.com>, catalin.marinas@arm.com,
 bjorn.andersson@linaro.org, hpa@zytor.com, will@kernel.org, corbet@lwn.net,
 jinho lim <jordan.lim@samsung.com>, agross@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, Dave Martin <Dave.Martin@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, jslaby@suse.com,
 Alexios Zavras <alexios.zavras@intel.com>, bp@alien8.de, tglx@linutronix.de,
 mingo@redhat.com, Allison Randal <allison@lohutok.net>,
 linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

In order to make early kgdb work properly we need early_brk64() to be
able to call into it.  This is as easy as adding a call into
call_break_hook() just like we do later in the normal brk_handler().

Once we do this we can let kgdb know that it can break into the
debugger a little earlier (specifically when parsing early_param's).

NOTE: without this patch it turns out that arm64 can't do breakpoints
even at dbg_late_init(), so if we decide something about this patch is
wrong we might need to move dbg_late_init() a little later.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---

Changes in v4:
- Add "if KGDB" to "select ARCH_HAS_EARLY_DEBUG" in Kconfig.

Changes in v3:
- Change boolean weak function to KConfig.

Changes in v2: None

 arch/arm64/Kconfig                      | 1 +
 arch/arm64/include/asm/debug-monitors.h | 2 ++
 arch/arm64/kernel/debug-monitors.c      | 2 +-
 arch/arm64/kernel/traps.c               | 3 +++
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 40fb05d96c60..3d78f581269c 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -13,6 +13,7 @@ config ARM64
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
 	select ARCH_HAS_DMA_PREP_COHERENT
 	select ARCH_HAS_ACPI_TABLE_UPGRADE if ACPI
+	select ARCH_HAS_EARLY_DEBUG if KGDB
 	select ARCH_HAS_FAST_MULTIPLIER
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_GCOV_PROFILE_ALL
diff --git a/arch/arm64/include/asm/debug-monitors.h b/arch/arm64/include/asm/debug-monitors.h
index 7619f473155f..2d82a0314d29 100644
--- a/arch/arm64/include/asm/debug-monitors.h
+++ b/arch/arm64/include/asm/debug-monitors.h
@@ -97,6 +97,8 @@ void unregister_user_break_hook(struct break_hook *hook);
 void register_kernel_break_hook(struct break_hook *hook);
 void unregister_kernel_break_hook(struct break_hook *hook);
 
+int call_break_hook(struct pt_regs *regs, unsigned int esr);
+
 u8 debug_monitors_arch(void);
 
 enum dbg_active_el {
diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
index 48222a4760c2..59c353dfc8e9 100644
--- a/arch/arm64/kernel/debug-monitors.c
+++ b/arch/arm64/kernel/debug-monitors.c
@@ -297,7 +297,7 @@ void unregister_kernel_break_hook(struct break_hook *hook)
 	unregister_debug_hook(&hook->node);
 }
 
-static int call_break_hook(struct pt_regs *regs, unsigned int esr)
+int call_break_hook(struct pt_regs *regs, unsigned int esr)
 {
 	struct break_hook *hook;
 	struct list_head *list;
diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index cf402be5c573..a8173f0c1774 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -1044,6 +1044,9 @@ int __init early_brk64(unsigned long addr, unsigned int esr,
 	if ((comment & ~KASAN_BRK_MASK) == KASAN_BRK_IMM)
 		return kasan_handler(regs, esr) != DBG_HOOK_HANDLED;
 #endif
+	if (call_break_hook(regs, esr) == DBG_HOOK_HANDLED)
+		return 0;
+
 	return bug_handler(regs, esr) != DBG_HOOK_HANDLED;
 }
 
-- 
2.26.2.645.ge9eca65c58-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
