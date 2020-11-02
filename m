Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3632A29C2
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  2 Nov 2020 12:46:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kZYIV-0007Xx-Nm
	for lists+kgdb-bugreport@lfdr.de; Mon, 02 Nov 2020 11:46:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kZYIT-0007Xp-HG
 for kgdb-bugreport@lists.sourceforge.net; Mon, 02 Nov 2020 11:46:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=onEvuddY7rjjmRNmF3inPaMsobQ6rmeVGOOE4kPhESY=; b=FTOV4/M3lYq/TzZw37wa5coM8E
 7AteqVsu2eRMg9j7n8ya/+6T8BxeH13KGfM6bWsN4aiXya/wyjVWxZ7XC49ip4TBeI41LjKjuQ6p0
 9koby0hDOqddOB8ghxAGvGxuMspSw26VelPPxyh+jDvuMEzxh4QaBbSo056owA2Cbs9g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=onEvuddY7rjjmRNmF3inPaMsobQ6rmeVGOOE4kPhESY=; b=HYHqF8AsI8sBOh/a29dMW4TCYb
 38EOllgtDgGL7Hx1cVjzESjLBjQ3MTdlG27/NRbyo9xuVwtcKIaz+mXOBZeJrRMCULuEw4wBHWlW6
 fo7kOnvzeN/rDx3YgNowB5TSt4knGiS1rsIP+uJx/QVxvAWZkMU09tS1Tcmd0cDW1pyI=;
Received: from mail-pg1-f194.google.com ([209.85.215.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kZYIH-00GGm1-9X
 for kgdb-bugreport@lists.sourceforge.net; Mon, 02 Nov 2020 11:46:49 +0000
Received: by mail-pg1-f194.google.com with SMTP id t14so10587085pgg.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 02 Nov 2020 03:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=onEvuddY7rjjmRNmF3inPaMsobQ6rmeVGOOE4kPhESY=;
 b=Vr5aHR13z2KIKtAwzdZ9s6RuU5nLQfx+2eKHmCn96yKknRT+ZskWrmJ8yaTYMU7fWA
 Duj06UU0FTvBMzrM2Pr/1EXdpd1MkKR4u8DSzE/cXXoIu/RyDBkLJKKUe93TQP2Wm5rf
 hFSWBvw5Qb1z4J3oRSY2qvEi1w86g4+e8BnVTllmTnVFPa87+8BVL0rk0aw9OP0YW0+D
 bwK9KSCqGu+AEQ7O7WhQ7SxBEVE5VEzdhEXC3uirBEKqUUTcFVohi3NdE8QMeghI5cde
 SX0R4CrRZA8D4lI4ATcq/88Bapzxz3tX8ALazIlthY7XTG13blWgKV/JHywhVKn9l2pS
 e8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=onEvuddY7rjjmRNmF3inPaMsobQ6rmeVGOOE4kPhESY=;
 b=iK8Dj3PXpdNZU+0KqXmBIP7iJ7R7rzjogn9wbcih8N7+GRV405QmOchvTu0YlIbqTO
 yOJbcxJl6XDQtOttsGmsU6Th0wulz2aLuUzQeg0C1FgUtz/+bm3/5zAFrOAbxM85KwPe
 x3ExJlois/fQziabkqzhsVql2JUtXikxcj/hUcQuhnsIT2bu/b7k6VVxd9IRcnxd3uOy
 iCsA85AE/bmwWPmlIyUMkry7qXmPpAsMEWysOjC4PqgvO5IEzu0YeKCXQ7ck1GUfJ7rL
 fcV9aEtwBTlquohOBvRFE8oBaGz9lr3tYZrXs1+Enftrh2bTozXlAiBOcjC2u3MD0tdF
 c7VA==
X-Gm-Message-State: AOAM533JVfYWgPY8ZaZwAhf+Nx3JnMfySsNYf/PIVzpxlcjGhZwQhsHm
 3Dp6fzWcpzf4bBldQpX3acG/XA==
X-Google-Smtp-Source: ABdhPJz6Klrso4Ngfvn20QS7DmYsk6GOwWNXcIzsTkWC0MaK8geg5GBT9xWeV6BPg/9LlQGCX5EAwA==
X-Received: by 2002:a17:90a:d104:: with SMTP id
 l4mr12488404pju.194.1604317591809; 
 Mon, 02 Nov 2020 03:46:31 -0800 (PST)
Received: from localhost.localdomain ([122.173.169.225])
 by smtp.gmail.com with ESMTPSA id y5sm14276184pfq.79.2020.11.02.03.46.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Nov 2020 03:46:31 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: maz@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 daniel.thompson@linaro.org
Date: Mon,  2 Nov 2020 17:14:46 +0530
Message-Id: <1604317487-14543-7-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604317487-14543-1-git-send-email-sumit.garg@linaro.org>
References: <1604317487-14543-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.194 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kZYIH-00GGm1-9X
Subject: [Kgdb-bugreport] [PATCH v7 6/7] kgdb: Expose default CPUs roundup
 fallback mechanism
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

Add a new API kgdb_smp_call_nmi_hook() to expose default CPUs roundup
mechanism to a particular archichecture as a runtime fallback if it
detects to not support NMI roundup.

Currently such an architecture example is arm64 supporting pseudo NMIs
feature which is only available on platforms which have support for GICv3
or later version.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 include/linux/kgdb.h      | 12 ++++++++++++
 kernel/debug/debug_core.c |  8 +++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index 0d6cf64..4190f13 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -200,6 +200,18 @@ kgdb_arch_handle_qxfer_pkt(char *remcom_in_buffer,
 extern void kgdb_call_nmi_hook(void *ignored);
 
 /**
+ *	kgdb_smp_call_nmi_hook - Provide default fallback mechanism to
+ *				 round-up CPUs
+ *
+ *	If you're using the default implementation of kgdb_roundup_cpus()
+ *	this function will be called.  And if an arch detects at runtime to
+ *	not support NMI based roundup then it can fallback to default
+ *	mechanism using this API.
+ */
+
+extern void kgdb_smp_call_nmi_hook(void);
+
+/**
  *	kgdb_roundup_cpus - Get other CPUs into a holding pattern
  *
  *	On SMP systems, we need to get the attention of the other CPUs
diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 1e75a89..ae785d8 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -241,7 +241,7 @@ void __weak kgdb_call_nmi_hook(void *ignored)
 }
 NOKPROBE_SYMBOL(kgdb_call_nmi_hook);
 
-void __weak kgdb_roundup_cpus(void)
+void kgdb_smp_call_nmi_hook(void)
 {
 	call_single_data_t *csd;
 	int this_cpu = raw_smp_processor_id();
@@ -273,6 +273,12 @@ void __weak kgdb_roundup_cpus(void)
 			kgdb_info[cpu].rounding_up = false;
 	}
 }
+NOKPROBE_SYMBOL(kgdb_smp_call_nmi_hook);
+
+void __weak kgdb_roundup_cpus(void)
+{
+	kgdb_smp_call_nmi_hook();
+}
 NOKPROBE_SYMBOL(kgdb_roundup_cpus);
 
 #endif
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
