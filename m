Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D57141A5BD7
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 12 Apr 2020 03:42:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jNRe7-0004x2-MP
	for lists+kgdb-bugreport@lfdr.de; Sun, 12 Apr 2020 01:42:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <vincent.chen@sifive.com>) id 1jNRe5-0004wl-Tm
 for kgdb-bugreport@lists.sourceforge.net; Sun, 12 Apr 2020 01:42:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ypjMRr4BDxH3QCgYXqxdYmDazqtkcKZ0EnHifbKcm6k=; b=Xk93dzc7ZvKlKU2TLSGDm2eVgl
 66UhsCuz3Ri5tY2f/u28BbViWlMOernPTcAKV84pGV9G2FfVWizQLDM5Oe1v0vlNgH/UeRqimXgNH
 d1Cr9+egTigCRgIrhbexEaEA3dT7o+pWoU0Tpgb2JT+3RzUAMF1AT3AZBtfHZ6SKAJJk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ypjMRr4BDxH3QCgYXqxdYmDazqtkcKZ0EnHifbKcm6k=; b=PtCMXUoAZrnuBLMlb2xcRrkPE2
 O8Lh3Rq2jt11rXwHlBnnKe2scfzsitz7+iADm7CDHQld1ubbFBbjqeNACA8/0cfoUtRgHzBIiSLcL
 AmwELMNadOwUtKZb9NSLexQ3QsxLC/9PleRNDdf55OXqdy+2969dYvhFQt0cE+AnLOZY=;
Received: from mail-pl1-f195.google.com ([209.85.214.195])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jNRe2-00FaUC-3b
 for kgdb-bugreport@lists.sourceforge.net; Sun, 12 Apr 2020 01:42:49 +0000
Received: by mail-pl1-f195.google.com with SMTP id x2so2103155plv.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sat, 11 Apr 2020 18:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ypjMRr4BDxH3QCgYXqxdYmDazqtkcKZ0EnHifbKcm6k=;
 b=NSTtDPtHL2yE7MBmqCEKz1KgTE6FsUHhS+I2JyFB1WAWMq2LpvuwhTA4uhrTbonI8o
 wB7IRMv2jfy0W99vek5DHbouEpXojaA4NZMAO/jv6ZcaaPoWxStylHQXjRntHYvT19pv
 MDP5kdc5IK0SohURtUF6T8qfXHQz46ux+AeRuU3iKoPxgpab8Ro0oa9/U+ZxwBpukD+u
 gNiieLPOWKgw1R+kxbRI6/ON5oFK848cnaRmusSJkpqW/fjeojm5kfvB9gQZ05Xo5sU7
 7QHqBtuuP6pBO9S5eRj2Q/16ATTv5SDEByX5yU5rltRIltxRok32qgMU2kSu9QtOA4Xm
 lz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ypjMRr4BDxH3QCgYXqxdYmDazqtkcKZ0EnHifbKcm6k=;
 b=pciUGW0rdsmxUB1SEWaunpL6IQKydUNzFFO9MraOAChiyBtjx7dSRmgrcJgAOlwHbW
 w5CwOl9yHU1Jjf/McoeEW32rq3QqgZrIVgCTBITVCxDvly/Mzj+vg3NqYHTHbepu5rvB
 yJhkJz2DgEopcM0gJL18RbJ4DNAJHQKGmv1gNrWotfoE0O9tO78Hj0vuJBxYf3T7uRUf
 FcFNTLZu7l2lnA/Y6ewPXqR68pMB1OsKSMRGEcHsGu9GQKoOtGRfCG7UvfjbAoX/bw38
 ayQhzb6lVNtXj4TXjQlCqraGKA8GuUwfyBB1QWdcjtn02GkO2wRlBe/68aXSkh3RDn+3
 D8QA==
X-Gm-Message-State: AGi0PuZCPPtppuH4dcCfoWL1K2cXtX/pcbzutu5x7cXKbQagGcQXTW7j
 ztifm6AjUeh8REEW92i4SqXvrw==
X-Google-Smtp-Source: APiQypK87IXmkPbhYAQP+mchO0WTYuSmptfJVanD/j7ChuO8UmHRMZGJ28WVj+OCPYKD1vmxx9D0Nw==
X-Received: by 2002:a17:90a:e548:: with SMTP id
 ei8mr14157255pjb.144.1586655760302; 
 Sat, 11 Apr 2020 18:42:40 -0700 (PDT)
Received: from localhost.localdomain (123-195-35-41.dynamic.kbronet.com.tw.
 [123.195.35.41])
 by smtp.gmail.com with ESMTPSA id w90sm5252900pjj.2.2020.04.11.18.42.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 11 Apr 2020 18:42:39 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: daniel.thompson@linaro.org, paul.walmsley@sifive.com, palmer@dabbelt.com
Date: Sun, 12 Apr 2020 09:41:59 +0800
Message-Id: <1586655721-22567-4-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586655721-22567-1-git-send-email-vincent.chen@sifive.com>
References: <1586655721-22567-1-git-send-email-vincent.chen@sifive.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: sifive.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.195 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jNRe2-00FaUC-3b
Subject: [Kgdb-bugreport] [PATCH v3 3/5] kgdb: enable arch to support XML
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
architecture defines CONFIG_ACRH_SUPPORTS_GDB_XML and implement its own
arch_handle_qxfer_pkt(). Except for the arch_handle_qxfer_pkt(), the
architecture also needs to record the feature supported by gdb stub into
the arch_gdb_stub_feature, and these features will be reported to host gdb
when gdb stub receives the qSupported packet.

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
