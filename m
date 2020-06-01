Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A391E9C62
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  1 Jun 2020 06:09:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jfblJ-00030t-KC
	for lists+kgdb-bugreport@lfdr.de; Mon, 01 Jun 2020 04:09:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <vincent.chen@sifive.com>) id 1jfblI-00030l-5i
 for kgdb-bugreport@lists.sourceforge.net; Mon, 01 Jun 2020 04:09:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b8VULp95Fx1AsmZEtKU1sx+4IqykdSqOWh3STBA2iqs=; b=XlB++ILVQOThS3triMpxVFEI40
 gehkMCF0j0YADUcwhS7d2flOFnZHywsLYdP9q998CLZCbAa3JmQq5YnNqk5rFeatdqnbOk8bSthdS
 x7XjV18cbJJQ8407F1UXIYZ8BRFpdJTor/ekQuVXcTwx3wOQuzIOXqxdACzMMiMN47Ts=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b8VULp95Fx1AsmZEtKU1sx+4IqykdSqOWh3STBA2iqs=; b=kGsSzAjv2NoaDaYvoj2RyJt+KQ
 FFXEmN4ihtCfsWHEYosbu9Qf3ZqoTD31m5LEwKW/KqFXFzgTf4d51WnQ3IdJwRtLtt6n2K788ZrUj
 J7hDMWGojECmNG2CJyi3INKyKiikcUlAHZHpeWLSiIdijGvSle/zOMqqkKm5WFsvHAA8=;
Received: from mail-pf1-f169.google.com ([209.85.210.169])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jfblE-002o1y-Aa
 for kgdb-bugreport@lists.sourceforge.net; Mon, 01 Jun 2020 04:09:20 +0000
Received: by mail-pf1-f169.google.com with SMTP id a127so792355pfa.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 31 May 2020 21:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=b8VULp95Fx1AsmZEtKU1sx+4IqykdSqOWh3STBA2iqs=;
 b=GO8df4OSMR//XRwKmPeid/edkCEndtoRlyBhWBxLJrA9rT8/gAdJferjGDgBN9oqlR
 3dTITF/82VRRwavjgDYiK6J7U40Fbh8dNaozac2BvfEVCwS5R4p3KATwlgiO7yZ8Jbgp
 C6hqm8OA+kKX4rLXu4g4W3167XJicm4EVvr6eubeS/KhEelUWXDCEz/pc4l++PSizZ1s
 8EJwL6LbGJlDkcNVYe7Pm1lj65DDuk7W+TddOqrbkH9pD0LOP5MT+SstwV6YKVcjO3vR
 xrDNPstANci2ZcmWntWA42PxiE7AurgG9Aryoj0e3vDM37+IqC5s2A19JrakUwznJPeN
 Bh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=b8VULp95Fx1AsmZEtKU1sx+4IqykdSqOWh3STBA2iqs=;
 b=lUNh7kTttueuAJy9Q7XSILWGDW0S/zvTzc32fGGZUFfLRwsIIKctd8CxX/WyCn5l8O
 +K4CL2LQHzzrQwlkApcYd54dtdu28f5g4+o+dKK76L83Z6qYCJBoUF2l0YkLeXMbwCzK
 MMMpKadSsNotG4CgmGX+aIj7xfrwO5/kgTzTHjSHUsg0F97ERjDE7pkPwL4mzFUdyjUZ
 K4CUOHzggJkNqUhnmoX0CH5t5O0qSY+ybrLAWLhw26IIMompGJ8nRfUNsG7dSBSOFaxm
 l53DMZDoWm7LGnJbheC9zf38zW+ZDxH/UW8+RmLdcR8PsaUdgPWWyOUOpBf/1Cvy8oP8
 5zPg==
X-Gm-Message-State: AOAM533RWny3qb0lszA57ub8QjZbJXB40BJbxLM0aiT0KK47LHI1RyyD
 4Iemq93FxsyMZsf25gEQCf3BKsRwDyw=
X-Google-Smtp-Source: ABdhPJwsOzHsQiO6n0P34IilKP/uuoxlMMtoYMThR2PlovFhdcekYToeHKS/3jXoR12+/UPNCWfJSw==
X-Received: by 2002:a17:902:8697:: with SMTP id
 g23mr16137219plo.306.1590982801077; 
 Sun, 31 May 2020 20:40:01 -0700 (PDT)
Received: from VincentChen-ThinkPad-T480s.internal.sifive.com
 (2001-b400-e3df-96c7-30f0-f751-b645-f4e3.emome-ip6.hinet.net.
 [2001:b400:e3df:96c7:30f0:f751:b645:f4e3])
 by smtp.gmail.com with ESMTPSA id a7sm13102527pfa.187.2020.05.31.20.39.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 31 May 2020 20:40:00 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, daniel.thompson@linaro.org
Date: Mon,  1 Jun 2020 11:39:08 +0800
Message-Id: <1590982751-13401-4-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590982751-13401-1-git-send-email-vincent.chen@sifive.com>
References: <1590982751-13401-1-git-send-email-vincent.chen@sifive.com>
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: sifive.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.169 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.169 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jfblE-002o1y-Aa
Subject: [Kgdb-bugreport] [V5 patch 3/6] kgdb: enable arch to support XML
 packet support.
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-riscv@lists.infradead.org,
 Vincent Chen <vincent.chen@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The XML packet could be supported by required architecture if the
architecture defines CONFIG_HAVE_ARCH_KGDB_QXFER_PKT and implement its own
kgdb_arch_handle_qxfer_pkt(). Except for the kgdb_arch_handle_qxfer_pkt(),
the architecture also needs to record the feature supported by gdb stub
into the kgdb_arch_gdb_stub_feature, and these features will be reported
to host gdb when gdb stub receives the qSupported packet.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 include/linux/kgdb.h   | 11 +++++++++++
 kernel/debug/gdbstub.c | 13 +++++++++++++
 lib/Kconfig.kgdb       |  5 +++++
 3 files changed, 29 insertions(+)

diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index 03c64aa8ba36..0e7a12c59f26 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -177,6 +177,17 @@ kgdb_arch_handle_exception(int vector, int signo, int err_code,
 			   struct pt_regs *regs);
 
 /**
+ *	kgdb_arch_handle_qxfer_pkt - Handle architecture specific GDB XML
+ *				     packets.
+ *	@remcom_in_buffer: The buffer of the packet we have read.
+ *	@remcom_out_buffer: The buffer of %BUFMAX bytes to write a packet into.
+ */
+
+extern void
+kgdb_arch_handle_qxfer_pkt(char *remcom_in_buffer,
+			   char *remcom_out_buffer);
+
+/**
  *	kgdb_call_nmi_hook - Call kgdb_nmicallback() on the current CPU
  *	@ignored: This parameter is only here to match the prototype.
  *
diff --git a/kernel/debug/gdbstub.c b/kernel/debug/gdbstub.c
index 4b280fc7dd67..a0617c883029 100644
--- a/kernel/debug/gdbstub.c
+++ b/kernel/debug/gdbstub.c
@@ -792,6 +792,19 @@ static void gdb_cmd_query(struct kgdb_state *ks)
 		}
 		break;
 #endif
+#ifdef CONFIG_HAVE_ARCH_KGDB_QXFER_PKT
+	case 'S':
+		if (!strncmp(remcom_in_buffer, "qSupported:", 11))
+			strcpy(remcom_out_buffer, kgdb_arch_gdb_stub_feature);
+		break;
+	case 'X':
+		if (!strncmp(remcom_in_buffer, "qXfer:", 6))
+			kgdb_arch_handle_qxfer_pkt(remcom_in_buffer,
+						   remcom_out_buffer);
+		break;
+#endif
+	default:
+		break;
 	}
 }
 
diff --git a/lib/Kconfig.kgdb b/lib/Kconfig.kgdb
index 933680b59e2d..d7f70335efaf 100644
--- a/lib/Kconfig.kgdb
+++ b/lib/Kconfig.kgdb
@@ -3,6 +3,11 @@
 config HAVE_ARCH_KGDB
 	bool
 
+# set if architecture has the its kgdb_arch_handle_qxfer_pkt
+# function to enable gdb stub to address XML packet sent from GDB.
+config HAVE_ARCH_KGDB_QXFER_PKT
+	bool
+
 menuconfig KGDB
 	bool "KGDB: kernel debugger"
 	depends on HAVE_ARCH_KGDB
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
