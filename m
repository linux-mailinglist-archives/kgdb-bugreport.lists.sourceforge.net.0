Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 460051AB5F0
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Apr 2020 04:38:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jOuQP-0002ci-1v
	for lists+kgdb-bugreport@lfdr.de; Thu, 16 Apr 2020 02:38:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <vincent.chen@sifive.com>) id 1jOuQM-0002cW-Jc
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Apr 2020 02:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kQL12V+rk/n12wWdEuAjZpuKmbELr6f2w7wpHP6B90g=; b=YRfLXDFGDUZFXDy19+/NvbZwH2
 V0yNS+mE6izPgE+FsB5CKpl8gYhGvaq6OyT7ntglzpN0XWS486utOcpAC5eLQc31KOp2ndNBvjmH5
 8LRvwlkJyb/ppc1wyTt5DmIsC8dSWKo3bflnigEBbwwZWBwFQ4nxyioZSIkXtVrj9D24=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kQL12V+rk/n12wWdEuAjZpuKmbELr6f2w7wpHP6B90g=; b=ZgFR5gzbXRBVOyuYi3rMkluZjN
 YjMLII33qdhjWLBti/uc9LE+DxaIvw9AnBAZgH+EyG8jwBAMH9MKU1vHPOAgkCBv/cO1EPxp4Gzek
 dQj7/PchpqtXs2NFp1O14QSan00JgiH2nRXJOPaEHpDdxrkQlDuLrfuyilhv6RBL5v7w=;
Received: from mail-pj1-f68.google.com ([209.85.216.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jOuQL-003QvV-Ax
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Apr 2020 02:38:42 +0000
Received: by mail-pj1-f68.google.com with SMTP id z9so729248pjd.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 15 Apr 2020 19:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kQL12V+rk/n12wWdEuAjZpuKmbELr6f2w7wpHP6B90g=;
 b=KxdHPl5Xj57YzwLm2KIzI2++Bgg11gD8rvULipq+6WxJ0rba5dKua7q+SGK1Culr9d
 0dezfk0D3Ez0Sus5m3xcAxufUo61lm0MNHjpqqEH6apagtoNB39EcOugkTLnayUAhgcj
 j5CWb3imUe77HZTI5pnn4GrP5IQl5SFcIKYW3EAlERejJzqOBLdN4RxbE7ezll/HS3HS
 DGGrU/MJ7Mg2lwdwfowCZw32g4k3jgYCB3VR1kALdOGqhpOmZhaZf049Gx384x8xqs/2
 obwQzUIA7wVDQfeLUloywR3GVbX5jzwsTFJ50jLzrx/TP67clYj8RFxlHanORwR/gJvK
 OLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kQL12V+rk/n12wWdEuAjZpuKmbELr6f2w7wpHP6B90g=;
 b=OfFIqDacWY5n7okEyN/hvH+yFK3w7uV8/4Wxae4mXyf32DuNq2zMB7JJaTjk/iiVvg
 JBV2SMN7VzB9nJZ8V7Em8S9HY3XVJq0u3M5HdUftp4NU2xhcu6AhdKAy8aajHx7+hHyu
 QIAuot4nZ8r7//zicu3PyMIpvgliSLpbNnweHr0SX/Mgf5VhtnpwVyiLHnMhoOMu9XBt
 nFDcD70e+6s6/QHo2HDI2jYWruu+DKMYncKMhLJaRwp9oU7bAHxhs/MYDif6Cb0OT7ag
 PTtMPpkXs6L+l7r7m2qDVw7rlEWX1wNDVlM2Pgm05xGQ1Cj5UsGEo2/3cfq6L9g46e4U
 F2Bg==
X-Gm-Message-State: AGi0Pua5Dyauz7hkTpzzcMot9Fl2FCR0RjpHgBu08X9g1VnQEtWlEbpa
 G6VPvVt0aYZCUevYxZx3BW53hg==
X-Google-Smtp-Source: APiQypJlXo9zQXDx/nvUUytOemoi96Kf2ZZ2BE2KWbptvcDTYFsOijI/7XG/Zc9QTohZ0W6z26C81w==
X-Received: by 2002:a17:90a:2ac7:: with SMTP id
 i7mr2461174pjg.130.1587004715561; 
 Wed, 15 Apr 2020 19:38:35 -0700 (PDT)
Received: from VincentChen-ThinkPad-T480s.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id i25sm11347536pfd.140.2020.04.15.19.38.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 Apr 2020 19:38:35 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, daniel.thompson@linaro.org
Date: Thu, 16 Apr 2020 10:38:06 +0800
Message-Id: <1587004688-19788-4-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587004688-19788-1-git-send-email-vincent.chen@sifive.com>
References: <1587004688-19788-1-git-send-email-vincent.chen@sifive.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: sifive.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.68 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jOuQL-003QvV-Ax
Subject: [Kgdb-bugreport] [PATCH v4 3/5] kgdb: enable arch to support XML
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
---
 include/linux/kgdb.h   | 11 +++++++++++
 kernel/debug/gdbstub.c | 13 +++++++++++++
 lib/Kconfig.kgdb       |  5 +++++
 3 files changed, 29 insertions(+)

diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index b072aeb1fd78..414bef20a8f3 100644
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
