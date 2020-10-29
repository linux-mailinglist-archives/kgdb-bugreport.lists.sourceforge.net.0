Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9207B29EFE3
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 29 Oct 2020 16:29:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kY9rs-0002PZ-CP
	for lists+kgdb-bugreport@lfdr.de; Thu, 29 Oct 2020 15:29:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kY9rq-0002Ou-NJ
 for kgdb-bugreport@lists.sourceforge.net; Thu, 29 Oct 2020 15:29:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vRwqyoyBEeMity0cyda+uu/rJEIK2HXvyD5N7tr1KQA=; b=M7ZwdBFd4nXVlE2HTt6uRPEPtb
 6yJ7Nbgpd0Mm78AJ9FDq3jySJZLXFLdyvuxAEuzJH+MXG5t9hDagfv9zW9fc6WL3SM5huTWeXazaR
 jt2DS5Uuf5qPGs1x3fA84yPPnOgijSeByIkb2q1+H3dMCqhFtMxmVUhpgESY2s+LOwS0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vRwqyoyBEeMity0cyda+uu/rJEIK2HXvyD5N7tr1KQA=; b=CGeRtcAoQxKGRBwJE8wvJXvzgS
 cHx2gbMZ82jrDRYKlMyX+qyWrTvuylAwcq8cB+qZMHdP8aS1U7FJ7LxfjGt8rLUXb8DxGdNpVuP4F
 +uXYt6/BemrG8hSsKV7wvQfgB/Jhm/i7HyAV/sGuxLZjeU6iHxaddgTGh2QwNV/TLH7k=;
Received: from mail-vk1-f193.google.com ([209.85.221.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kY9rW-00Bih8-Oc
 for kgdb-bugreport@lists.sourceforge.net; Thu, 29 Oct 2020 15:29:28 +0000
Received: by mail-vk1-f193.google.com with SMTP id a8so791599vkm.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 29 Oct 2020 08:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vRwqyoyBEeMity0cyda+uu/rJEIK2HXvyD5N7tr1KQA=;
 b=VaV6/Go+khoksNqGfCUHDeBSHVzAJEA+svM5XJTrMpaiwQW5OlTmX/9P+0AhI2Wgrc
 eaYH6kMXDCKlBsBdwgq0a2AvqpQJFku5TSiBp8O9O1W6GvFJvEqB0WWZiW7gaMNQT2PN
 JjueUsyk1j1ZDQ4eRWBrzvLUpzbK6D7wXp99Ea6n2DFJoqRpGOqqVsM7B4ahs+rEim/x
 7GCHwMuXp3+jVVF5LWSemEJME2d/XEGagujBza5F+oXi2yDsg2/yn7tJa2lMuruEsQyG
 zzn4vNRJTm1+P8cplXnjZhqwceqWIQYRcmtckz5f8cQH8CuKEpDZGwf2pC+80kwUCRzu
 /OlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vRwqyoyBEeMity0cyda+uu/rJEIK2HXvyD5N7tr1KQA=;
 b=gX4wqh5OmjrHJ+j9XqhFB6/y7vHGf0wlD14rl32Hy2SPVlcMOVGqWRbzoxwFSmP+Dt
 Gbm41qDqnxewFCAuOE9Mknpy1UzobE+H2kPSCrPUiVO6RTNpnC5DNmpUto39DWvgi0ZR
 XrldlL72Zi40/+gr7hsJ9iDxZkwnIOcO091KXHr7MCJLZhdCs0bTN+FRq6jm5pkkEOqM
 IBGEcx5gZAkxZMsr8jnxcXPTwYpgpFKaBqwrNYsQ4wYyJF7OeHd6kiW2TH2RX0EEnn6i
 ft0FtJ78f5Rnyrt6Awz4nNIzJEmbDCxyi5ytRlMXW35t7ag6lGBQG/3gW5gGFC5hAWDA
 5FrA==
X-Gm-Message-State: AOAM531aFyT3xABIw0pQXkYpWygUIozsXjOnchzv3PfHfwDpwIpxPOJ0
 xvO2XvPmGillxnHpJ8J5Cva/Uhxw6nEP2A==
X-Google-Smtp-Source: ABdhPJyZHAWcF9UXIuaciASbmUM2nhi5xQ3CWgJ6UeAed6E2uiOLILawF0T8+k3uKF2R+aWSxlR5CA==
X-Received: by 2002:a17:902:7c86:b029:d5:f680:f756 with SMTP id
 y6-20020a1709027c86b02900d5f680f756mr4717679pll.39.1603983543591; 
 Thu, 29 Oct 2020 07:59:03 -0700 (PDT)
Received: from localhost.localdomain ([117.252.71.231])
 by smtp.gmail.com with ESMTPSA id j11sm3085082pfc.64.2020.10.29.07.58.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Oct 2020 07:59:02 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: maz@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org
Date: Thu, 29 Oct 2020 20:26:26 +0530
Message-Id: <1603983387-8738-7-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603983387-8738-1-git-send-email-sumit.garg@linaro.org>
References: <1603983387-8738-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: 1.4 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.5 RCVD_IN_SORBS_WEB      RBL: SORBS: sender is an abusable web server
 [117.252.71.231 listed in dnsbl.sorbs.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.193 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.193 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kY9rW-00Bih8-Oc
Subject: [Kgdb-bugreport] [PATCH v6 6/7] kgdb: roundup: Allow runtime arch
 specific override
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, tsbogend@alpha.franken.de,
 linux-kernel@vger.kernel.org, jason@lakedaemon.net, ito-yuichi@fujitsu.com,
 mpe@ellerman.id.au, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com,
 bp@alien8.de, julien.thierry.kdev@gmail.com, jason.wessel@windriver.com,
 kgdb-bugreport@lists.sourceforge.net, tglx@linutronix.de,
 msys.mizuma@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Add a new API kgdb_arch_roundup_cpus() for a particular archichecture to
override default kgdb roundup and if it detects at runtime to not support
NMI roundup then it can fallback to default implementation using async
SMP cross-calls.

Currently such an architecture example is arm64 supporting pseudo NMIs
feature which is only available on platforms which have support for GICv3
or later version.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 arch/powerpc/kernel/kgdb.c |  3 ++-
 arch/sparc/kernel/smp_64.c |  3 ++-
 arch/x86/kernel/kgdb.c     |  6 ++++--
 include/linux/kgdb.h       |  5 +++--
 kernel/debug/debug_core.c  | 10 +++++++++-
 5 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/kgdb.c b/arch/powerpc/kernel/kgdb.c
index 4090802..126575d 100644
--- a/arch/powerpc/kernel/kgdb.c
+++ b/arch/powerpc/kernel/kgdb.c
@@ -125,9 +125,10 @@ static int kgdb_debugger_ipi(struct pt_regs *regs)
 }
 
 #ifdef CONFIG_SMP
-void kgdb_roundup_cpus(void)
+bool kgdb_arch_roundup_cpus(void)
 {
 	smp_send_debugger_break();
+	return true;
 }
 #endif
 
diff --git a/arch/sparc/kernel/smp_64.c b/arch/sparc/kernel/smp_64.c
index e38d8bf..c459c83 100644
--- a/arch/sparc/kernel/smp_64.c
+++ b/arch/sparc/kernel/smp_64.c
@@ -1014,9 +1014,10 @@ void flush_dcache_page_all(struct mm_struct *mm, struct page *page)
 }
 
 #ifdef CONFIG_KGDB
-void kgdb_roundup_cpus(void)
+bool kgdb_arch_roundup_cpus(void)
 {
 	smp_cross_call(&xcall_kgdb_capture, 0, 0, 0);
+	return true;
 }
 #endif
 
diff --git a/arch/x86/kernel/kgdb.c b/arch/x86/kernel/kgdb.c
index ff7878d..1b756d9 100644
--- a/arch/x86/kernel/kgdb.c
+++ b/arch/x86/kernel/kgdb.c
@@ -404,7 +404,8 @@ static void kgdb_disable_hw_debug(struct pt_regs *regs)
 
 #ifdef CONFIG_SMP
 /**
- *	kgdb_roundup_cpus - Get other CPUs into a holding pattern
+ *	kgdb_arch_roundup_cpus - Get other CPUs into a holding pattern
+ *				 in an architectural specific manner
  *
  *	On SMP systems, we need to get the attention of the other CPUs
  *	and get them be in a known state.  This should do what is needed
@@ -414,9 +415,10 @@ static void kgdb_disable_hw_debug(struct pt_regs *regs)
  *
  *	On non-SMP systems, this is not called.
  */
-void kgdb_roundup_cpus(void)
+bool kgdb_arch_roundup_cpus(void)
 {
 	apic_send_IPI_allbutself(NMI_VECTOR);
+	return true;
 }
 #endif
 
diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index 0d6cf64..f9db5b8 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -200,7 +200,8 @@ kgdb_arch_handle_qxfer_pkt(char *remcom_in_buffer,
 extern void kgdb_call_nmi_hook(void *ignored);
 
 /**
- *	kgdb_roundup_cpus - Get other CPUs into a holding pattern
+ *	kgdb_arch_roundup_cpus - Get other CPUs into a holding pattern
+ *				 in an architectural specific manner
  *
  *	On SMP systems, we need to get the attention of the other CPUs
  *	and get them into a known state.  This should do what is needed
@@ -210,7 +211,7 @@ extern void kgdb_call_nmi_hook(void *ignored);
  *
  *	On non-SMP systems, this is not called.
  */
-extern void kgdb_roundup_cpus(void);
+extern bool kgdb_arch_roundup_cpus(void);
 
 /**
  *	kgdb_arch_set_pc - Generic call back to the program counter
diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 1e75a89..27e401c 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -241,13 +241,21 @@ void __weak kgdb_call_nmi_hook(void *ignored)
 }
 NOKPROBE_SYMBOL(kgdb_call_nmi_hook);
 
-void __weak kgdb_roundup_cpus(void)
+bool __weak kgdb_arch_roundup_cpus(void)
+{
+	return false;
+}
+
+static void kgdb_roundup_cpus(void)
 {
 	call_single_data_t *csd;
 	int this_cpu = raw_smp_processor_id();
 	int cpu;
 	int ret;
 
+	if (kgdb_arch_roundup_cpus())
+		return;
+
 	for_each_online_cpu(cpu) {
 		/* No need to roundup ourselves */
 		if (cpu == this_cpu)
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
