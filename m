Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2C7744316
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 30 Jun 2023 22:12:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qFKTh-0005pF-8n
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 30 Jun 2023 20:12:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1qFKTf-0005p9-FA
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 30 Jun 2023 20:12:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f2ZM8TAtIacJ4fI9wC/ZCbMv5lNvIQluS4wA6x6MSls=; b=QVDPD3uaS3NQLwL6jJgBJI742K
 16E7zHuVzry279GSv54V3p2OnV7x5R80gLylsUdRuKH6w4++NwL7igIRb/mEuqYFEzA7mSbZOKufA
 pspttZD4zGByUmx6eaTEFYxepSqkDKrwXIuXi8Wc/HwTvPhSjKcFv88qLL6yDlt+zHjY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=f2ZM8TAtIacJ4fI9wC/ZCbMv5lNvIQluS4wA6x6MSls=; b=f
 FG0a5vp1wyerD+OIZPrMlMmisT8oNptLuNfFEgiy4wFBPdzuWcdTM6GTsM7rIaVriH54ioOu2bddP
 B6yKaqGqU0amPiLu9ClLmMlzCk6Q5BnfkaljV6dlEjb5y+EcPZJxzxnW6EgSWh3KtPu3zx+qAryjE
 8pNK9BXD2RpaiaOQ=;
Received: from mail-wm1-f50.google.com ([209.85.128.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qFKTY-00059I-Jn for kgdb-bugreport@lists.sourceforge.net;
 Fri, 30 Jun 2023 20:12:23 +0000
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-3fbc63c307fso12768895e9.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 30 Jun 2023 13:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688155930; x=1690747930;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f2ZM8TAtIacJ4fI9wC/ZCbMv5lNvIQluS4wA6x6MSls=;
 b=BWDFeb5Yrm02k2/rQGE2yNvMFjOIpxixKtPY/K7ZLPB7OeoS2YJRFMm5XQ+NaGkrKg
 v2yvDru+Ya9+sQGTRl7AacdNxJmmrbZvJ/xWZNGVCXVb/x9bNUWbvIwVLE9wm5S7OBIg
 UG5J/ib2grrT1hD9HS4lfsedaibUfOl+mHISEXNcjolXpcMd3RBfdmR/S8CKr4yS/oGV
 7JICnbcW8LKOhhf1dahdBLIxvpx+l9iA2yYyX1XEP05mhVTb8F58xyg9GlFb1aQO+o3z
 OEKHLrNUPWR59Mk/O25x10Gt7HCj7j8cpozrqXFRBxEpNBPKNNLW+b/g3ec4K/nza1Ns
 CnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688155930; x=1690747930;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f2ZM8TAtIacJ4fI9wC/ZCbMv5lNvIQluS4wA6x6MSls=;
 b=kV1XVF2/PivUkOJb1HIkUKeccha5uaSPAVH6EUzedV9y+apiNO/Sy1lePDSSM2YYC6
 DpiHbsvt6ETE0ftbV6AuL4pa6Mm2vA+pNoPmfw8DEnibC9BubMpwSKx2sUnweZkpUEuc
 vJmnXsAeEdDn0Rz0o0xEUa5aFYEMlncTsHB5qJ7+sBrwp8fXNltTQBrrMb/3oKS/x/iY
 U1/CZZ4dsmfGDxXZq6oB4HYjKfpJNX+5itD+zCdmDIRhfbcg+7jad0hdeebPpn84OY3e
 3HVoWmOEEsWNU481aReBoLaAQYsdKRoQo6+NYaB5ho2iKMpjBmwudtivagqhUYJP8mjL
 hVuw==
X-Gm-Message-State: AC+VfDw1CJo6YynPcjIgLLj+QV7lPBEt+tiCfcIZsqE6t6210FqJyBgz
 kpXkf46GAwEsTdVkLWRGIoPwnQ==
X-Google-Smtp-Source: ACHHUZ772+lDulYVp/lG3ggTa/L0EU4PTnIcpqAElW5g0jYoioXAknBYmrt94ZrEgkCfhctQPwf/1g==
X-Received: by 2002:a05:600c:2253:b0:3fb:a5b3:4f02 with SMTP id
 a19-20020a05600c225300b003fba5b34f02mr2810094wmm.36.1688155930010; 
 Fri, 30 Jun 2023 13:12:10 -0700 (PDT)
Received: from wychelm.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a05600c0b5000b003fba6709c68sm10686143wmr.47.2023.06.30.13.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 13:12:09 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Fri, 30 Jun 2023 21:12:06 +0100
Message-Id: <20230630201206.2396930-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: kdb_send_sig() is defined in the signal code and called from
 kdb, but the declaration is part of the kdb internal code. Move the declaration
 to the shared header to avoid the warning: kernel/signal.c:4789:6: error:
 no previous prototype for 'kdb_send_sig' [-Werror=missing-prototypes] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.50 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.50 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qFKTY-00059I-Jn
Subject: [Kgdb-bugreport] [PATCH] kdb: move kdb_send_sig() declaration to a
 better header file
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

kdb_send_sig() is defined in the signal code and called from kdb,
but the declaration is part of the kdb internal code.
Move the declaration to the shared header to avoid the warning:

kernel/signal.c:4789:6: error: no previous prototype for 'kdb_send_sig' [-Werror=missing-prototypes]

Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 include/linux/kdb.h            | 2 ++
 kernel/debug/kdb/kdb_private.h | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/kdb.h b/include/linux/kdb.h
index 07dfb6a20a1c4..f6c2ddb16b958 100644
--- a/include/linux/kdb.h
+++ b/include/linux/kdb.h
@@ -196,6 +196,8 @@ int kdb_process_cpu(const struct task_struct *p)
 	return cpu;
 }

+extern void kdb_send_sig(struct task_struct *p, int sig);
+
 #ifdef CONFIG_KALLSYMS
 extern const char *kdb_walk_kallsyms(loff_t *pos);
 #else /* ! CONFIG_KALLSYMS */
diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
index 1f8c519a5f81c..548fd4059bf9b 100644
--- a/kernel/debug/kdb/kdb_private.h
+++ b/kernel/debug/kdb/kdb_private.h
@@ -194,7 +194,6 @@ extern char kdb_task_state_char (const struct task_struct *);
 extern bool kdb_task_state(const struct task_struct *p, const char *mask);
 extern void kdb_ps_suppressed(void);
 extern void kdb_ps1(const struct task_struct *p);
-extern void kdb_send_sig(struct task_struct *p, int sig);
 extern char kdb_getchar(void);
 extern char *kdb_getstr(char *, size_t, const char *);
 extern void kdb_gdb_state_pass(char *buf);

base-commit: 858fd168a95c5b9669aac8db6c14a9aeab446375
--
2.39.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
