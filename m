Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D66C2A29BF
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  2 Nov 2020 12:46:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kZYIA-0001rq-0W
	for lists+kgdb-bugreport@lfdr.de; Mon, 02 Nov 2020 11:46:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kZYI7-0001ri-6e
 for kgdb-bugreport@lists.sourceforge.net; Mon, 02 Nov 2020 11:46:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MUHxFreF4fdTU7bboIWPPhRLi/D8nJxSl4ZDICONfD4=; b=DQ30qs21chPbxkmSL2pGrWBh29
 eSdio+PzCjcS40CqmyC9M/4mGluykllGreMWh6nCVl471NsrOC/zXSBA8kmAaQiSMd+1uU0m1TzXW
 St0pzVhcYtrp6iz/6FwqXBZwMC2m6qOsxsB4g1ul9jbkYoJ//KzCZo79kHNoWmNTZ6os=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MUHxFreF4fdTU7bboIWPPhRLi/D8nJxSl4ZDICONfD4=; b=hVicw71vsY4N9uWk/VnxhUJvM1
 fvjgT3xtK+o1Z72NKvwzx2BgT1iYCG/pI4BX4OYjUeetImceMCA6JasnZLfmr796PQDQumxOatadw
 Wga+cLc+H22e2OIeCMhkltwQX/iZTIhFOShjNo74KjkUpmqs9Im+ynkU2Mwv5V26KHf8=;
Received: from mail-pg1-f195.google.com ([209.85.215.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kZYHz-00GGjs-Gx
 for kgdb-bugreport@lists.sourceforge.net; Mon, 02 Nov 2020 11:46:27 +0000
Received: by mail-pg1-f195.google.com with SMTP id o3so10546655pgr.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 02 Nov 2020 03:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MUHxFreF4fdTU7bboIWPPhRLi/D8nJxSl4ZDICONfD4=;
 b=ha5Oh0/yhwqxHYqeV2xZYGNZplQTwHBBADatw0eeG45ZZoigfIGoiJvN6h/BlE8LyJ
 D3wjSjKFh5pBsUJ8H/tdFo7x5DNFMUeiTbC+6i/Y4qSByeviCKuXNBo0wv8LXjAk236J
 11byt/UYRUypr9OWtDMsLG/JvZAsueXssqR2zD/ndCPX1qvrB6pz06lSqlA34SzlHjFt
 JM+jXLycY1kYGYlc7ONLsn3wiRKXpJFulqZdXJmBqCbhgZqtFSM1fNWsd72mB/hQWkK6
 +JVzv6M2lFVlGa6xgfEzE8mGb2TNkrxlW2sgIiWGSsWxseIr5bPLPEuf3e7I8WETSzaL
 a0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MUHxFreF4fdTU7bboIWPPhRLi/D8nJxSl4ZDICONfD4=;
 b=TKAq4j/Wdd3Zui5uolGqJG1N9mvrDeaXHEVe1UVrpCVmfKecaEwNVwp+xyjit25bGv
 weVADevh827jsItXkiCGMhv4ldZEAfwTNUah9M1/aTPGp7MRcmsXbUq8votnrsGd6kXP
 4lj9sV+lKYqlsQzNOE+hlAz2i/C7e9j7piCIIMGRuIITIoRVCzSaD8F5+p7RslS8p105
 GVfES1c18TtNlNobsooO2cQTrzL+hQN9S/cWTIRXVsYEeMjJYTBdzdc+u8eyTTf8gMSl
 lvQtC79poP/MAtVqbg2le2ifDBUegBRm/CN3Jre6Wuj2F4hQDutv5lecAip2pPXncVsb
 pycA==
X-Gm-Message-State: AOAM530Ao9PEtk7X7wJvzCscI1IHQVuA4CruJ1pWrTc3VCTSIfoupQcb
 0cb/i2MSQjLipT8WEuK96HQF3A==
X-Google-Smtp-Source: ABdhPJzuTgLuJa5NAjhe4lsISCMZZ15d16sBXJrpQCV0RydcHlai82EJu+jYTzX8/Ljhe8k6GBnDog==
X-Received: by 2002:a63:ff5b:: with SMTP id s27mr13157734pgk.383.1604317566593; 
 Mon, 02 Nov 2020 03:46:06 -0800 (PST)
Received: from localhost.localdomain ([122.173.169.225])
 by smtp.gmail.com with ESMTPSA id y5sm14276184pfq.79.2020.11.02.03.45.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Nov 2020 03:46:05 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: maz@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 daniel.thompson@linaro.org
Date: Mon,  2 Nov 2020 17:14:43 +0530
Message-Id: <1604317487-14543-4-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604317487-14543-1-git-send-email-sumit.garg@linaro.org>
References: <1604317487-14543-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.195 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.195 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kZYHz-00GGjs-Gx
Subject: [Kgdb-bugreport] [PATCH v7 3/7] arm64: smp: Assign and setup an IPI
 as NMI
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
Cc: mark.rutland@arm.com, tsbogend@alpha.franken.de,
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

Assign an unused IPI which can be turned as NMI using ipi_nmi framework.
Also, invoke corresponding dynamic IPI setup/teardown APIs.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 arch/arm64/kernel/smp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 82e75fc..2e118e2 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -43,6 +43,7 @@
 #include <asm/daifflags.h>
 #include <asm/kvm_mmu.h>
 #include <asm/mmu_context.h>
+#include <asm/nmi.h>
 #include <asm/numa.h>
 #include <asm/processor.h>
 #include <asm/smp_plat.h>
@@ -962,6 +963,8 @@ static void ipi_setup(int cpu)
 
 	for (i = 0; i < nr_ipi; i++)
 		enable_percpu_irq(ipi_irq_base + i, 0);
+
+	dynamic_ipi_setup(cpu);
 }
 
 #ifdef CONFIG_HOTPLUG_CPU
@@ -974,6 +977,8 @@ static void ipi_teardown(int cpu)
 
 	for (i = 0; i < nr_ipi; i++)
 		disable_percpu_irq(ipi_irq_base + i);
+
+	dynamic_ipi_teardown(cpu);
 }
 #endif
 
@@ -995,6 +1000,9 @@ void __init set_smp_ipi_range(int ipi_base, int n)
 		irq_set_status_flags(ipi_base + i, IRQ_HIDDEN);
 	}
 
+	if (n > nr_ipi)
+		set_smp_dynamic_ipi(ipi_base + nr_ipi);
+
 	ipi_irq_base = ipi_base;
 
 	/* Setup the boot CPU immediately */
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
