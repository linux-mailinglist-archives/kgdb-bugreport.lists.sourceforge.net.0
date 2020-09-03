Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D40A25C104
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  3 Sep 2020 14:30:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kDoNv-0006Gu-5d
	for lists+kgdb-bugreport@lfdr.de; Thu, 03 Sep 2020 12:30:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kDoNu-0006Gi-2a
 for kgdb-bugreport@lists.sourceforge.net; Thu, 03 Sep 2020 12:30:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Llf97xQzuVj1Ljy7SQLNwqvcHttw+vqN9qNvesLWdDk=; b=gch8+tlrnP3eZjoq81NWffNjMb
 euJRfjvIgucGSuzoTMA/oAclRA0ZtGh+NVXEHNErD8J+UglC2oaswEtprfBWfv14WYLtce/vBUneo
 Ctl+HoiD1HdBznbUHLdFyFgL7bg7E9fnhdvw38LSCgFlJSjY/ZlHFsCASewGPSAi6S0s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Llf97xQzuVj1Ljy7SQLNwqvcHttw+vqN9qNvesLWdDk=; b=kpL3pDJRqz29az8Y2ZlnkheKMB
 8hr/vI/9pkNHPBJjTJb52NNHRbInSjD+8zIxTk8uatymSewKm3TXATbcg3XOZ5PIVez3WlMRP9dvQ
 jAaa3l1QxX0HPm52yeXERIVH+YLiwmaKvPBVUh343t2axS3coURySgJm7qiD1QdK6oXc=;
Received: from mail-pg1-f196.google.com ([209.85.215.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kDoNq-00AVKK-Fg
 for kgdb-bugreport@lists.sourceforge.net; Thu, 03 Sep 2020 12:30:34 +0000
Received: by mail-pg1-f196.google.com with SMTP id l191so2017843pgd.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 03 Sep 2020 05:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Llf97xQzuVj1Ljy7SQLNwqvcHttw+vqN9qNvesLWdDk=;
 b=c0+JDYUrGCnpb/G/my1hmcnRrwWug0dnnFoSkE5Sw1nXQDHo/cLtcHKQmSaumkFbeH
 AnUKZEYnvMHNE/6oR8jAvucjsyVSt2y8De5zqTzfFQ06zyqZ+VWJ/fy8K/PZUHfRidAp
 MkC8GFMN9qg+kEI2EmzGdFS0vnnNeEKb6Cp5rPt1C6csrRlMa7JHunAy92hRRfPGTJdN
 9wG7RAfRCWsugjacZ+3Yy2w2LAn5NtF+uW0UnHF0Lc0gZTg2HY0yE3vPsAfnoEfD7jzO
 eKsTMzvprBDaBlrr62SBKJAXjsWCAe9ilJPwCwlsIWyRhE+o1zfDTyAY50KKurcJDgiI
 eqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Llf97xQzuVj1Ljy7SQLNwqvcHttw+vqN9qNvesLWdDk=;
 b=GPQiPG1VtipMudF+T31WZSmf3Ntgo45YDzRj8MSJYVx3H2ryo+rgjvJZ2iQe/W+kOy
 nYLyHz3IdUt0pbnMse/PrKQM0RaBL4kS6xQqbHSa3MWSzbXHbNEG0H5YEG2vz0glAr5r
 dcSntBmBLJqUY3+A7KMNLMSictBdRkYRpTIQM2yuD9StEYmVXOUnfzTIqVR51skbZvCc
 irIYrkYnRchxWNZABNvTtTyA/9PrKzUJ2wlq7U007BnUjCMUt/APWajmyuRggK0T4CBG
 oXF1oTApI1Zr+2K7UDNULxGfaAXjpYwgJMg7/J3Ubt6mizcjTUJGK+MRzxozLG7nNZQb
 TK8w==
X-Gm-Message-State: AOAM530nPqSPxIPc+AMhomUsTmnMbRSXyq1419h2bPNKhuUVRxm42VH6
 JgDelIQ2FX32ruAPyp/fLGZ5g5N8dGHxng==
X-Google-Smtp-Source: ABdhPJw6HtsVUIQpVpFCbqkFJyoJHA+cOMhTpfShrs4LKTMEak2ao3uyit7Wpi0M6ASCOtkZ8T/eAQ==
X-Received: by 2002:aa7:94a4:: with SMTP id a4mr3528509pfl.49.1599134748396;
 Thu, 03 Sep 2020 05:05:48 -0700 (PDT)
Received: from localhost.localdomain ([117.210.209.248])
 by smtp.gmail.com with ESMTPSA id s1sm2922022pgh.47.2020.09.03.05.05.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Sep 2020 05:05:47 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: maz@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org
Date: Thu,  3 Sep 2020 17:35:09 +0530
Message-Id: <1599134712-30923-2-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599134712-30923-1-git-send-email-sumit.garg@linaro.org>
References: <1599134712-30923-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kDoNq-00AVKK-Fg
Subject: [Kgdb-bugreport] [PATCH v3 1/4] arm64: smp: Introduce a new IPI as
 IPI_CALL_NMI_FUNC
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
Cc: daniel.thompson@linaro.org, jason@lakedaemon.net,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jason.wessel@windriver.com,
 tglx@linutronix.de, julien.thierry.kdev@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Introduce a new inter processor interrupt as IPI_CALL_NMI_FUNC that
can be invoked to run special handlers in NMI context. One such handler
example is kgdb_nmicallback() which is invoked in order to round up CPUs
to enter kgdb context.

As currently pseudo NMIs are supported on specific arm64 platforms which
incorporates GICv3 or later version of interrupt controller. In case a
particular platform doesn't support pseudo NMIs, IPI_CALL_NMI_FUNC will
act as a normal IPI which can still be used to invoke special handlers.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 arch/arm64/include/asm/smp.h |  1 +
 arch/arm64/kernel/smp.c      | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index 2e7f529..e85f5d5 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -89,6 +89,7 @@ extern void secondary_entry(void);
 
 extern void arch_send_call_function_single_ipi(int cpu);
 extern void arch_send_call_function_ipi_mask(const struct cpumask *mask);
+extern void arch_send_call_nmi_func_ipi_mask(const struct cpumask *mask);
 
 #ifdef CONFIG_ARM64_ACPI_PARKING_PROTOCOL
 extern void arch_send_wakeup_ipi_mask(const struct cpumask *mask);
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index b6bde26..1b4c07c 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -74,6 +74,7 @@ enum ipi_msg_type {
 	IPI_TIMER,
 	IPI_IRQ_WORK,
 	IPI_WAKEUP,
+	IPI_CALL_NMI_FUNC,
 	NR_IPI
 };
 
@@ -793,6 +794,7 @@ static const char *ipi_types[NR_IPI] __tracepoint_string = {
 	S(IPI_TIMER, "Timer broadcast interrupts"),
 	S(IPI_IRQ_WORK, "IRQ work interrupts"),
 	S(IPI_WAKEUP, "CPU wake-up interrupts"),
+	S(IPI_CALL_NMI_FUNC, "NMI function call interrupts"),
 };
 
 static void smp_cross_call(const struct cpumask *target, unsigned int ipinr);
@@ -840,6 +842,11 @@ void arch_irq_work_raise(void)
 }
 #endif
 
+void arch_send_call_nmi_func_ipi_mask(const struct cpumask *mask)
+{
+	smp_cross_call(mask, IPI_CALL_NMI_FUNC);
+}
+
 static void local_cpu_stop(void)
 {
 	set_cpu_online(smp_processor_id(), false);
@@ -932,6 +939,10 @@ static void do_handle_IPI(int ipinr)
 		break;
 #endif
 
+	case IPI_CALL_NMI_FUNC:
+		/* nop, IPI handlers for special features can be added here. */
+		break;
+
 	default:
 		pr_crit("CPU%u: Unknown IPI message 0x%x\n", cpu, ipinr);
 		break;
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
