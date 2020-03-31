Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B80919AC80
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  1 Apr 2020 15:17:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jJdFL-0007W8-Sp
	for lists+kgdb-bugreport@lfdr.de; Wed, 01 Apr 2020 13:17:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <vincent.chen@sifive.com>) id 1jJJ8H-0003hP-Dr
 for kgdb-bugreport@lists.sourceforge.net; Tue, 31 Mar 2020 15:48:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zqSnOP8ANUuvs66kR1I4ddHiFAM4cZaEpCbx3krDXPE=; b=CqGYah58NxEyGbIgyMXIMp565r
 loP/6p8YbwXPLLWprDddnT24Q4g/b4mh4HmkuB+A5c106bKPDU2Xwdo+1Ca3mXSr30wL945SNJwQF
 XrFH9QsC837PTy+xw3rqptpUgo+pFHB462PxmX/FVgwGG4Emb6gTwe0mKGxZh7/Lw4qc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zqSnOP8ANUuvs66kR1I4ddHiFAM4cZaEpCbx3krDXPE=; b=danrtHyMCTmU2vUiX4J+kSyNCv
 C2eu8WYXGdGETo0yTjS/kqLv94jqRzJQz1vVfO9kayjwHQrjXtc76jYa1Z/BUebM5dI8wZsP+zMgE
 kg0PNs8p9SfC6iJYaD55AvuSnFBXYbNPWSLU4HkRYvTHnM+g/V9VGf1mw5Ay4XTrJceU=;
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jJJ8C-00Guou-LO
 for kgdb-bugreport@lists.sourceforge.net; Tue, 31 Mar 2020 15:48:53 +0000
Received: by mail-oi1-f194.google.com with SMTP id m14so19368311oic.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 31 Mar 2020 08:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zqSnOP8ANUuvs66kR1I4ddHiFAM4cZaEpCbx3krDXPE=;
 b=h0BZdIc4bKQoTvQrDqvYL2Yk2htxSKIWIAaaQ1PHNfDrK0rHIZv2c1ss4c3rWGIWxf
 z7bz2fDdrC7AbF2Dl/yUnYh8yyVEKdNPGfdQR1bCCib1LAt66/zkXbFGzOhG0tdiTCeJ
 OMn7U6ld3iSgfSGS/rAtqwlKgZL7fPoFPdb1a4F4e5DjxIdGSwzMCYRSEhjnzdx+lFU9
 a2BGKuvNcbd+t1xTCQlTFJe8FZG6Q9/vDllEUDvEalILw/lSv6nbsjaN+rXtqqfuTuUh
 I6QpZ+E5iXxrG/xxgZnb71C08YBHSgF82SMlEWILd05T0Ge1aRPq4X5bJoqIsmOxiBw9
 cVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zqSnOP8ANUuvs66kR1I4ddHiFAM4cZaEpCbx3krDXPE=;
 b=YQLl17ggWk9DfUW5gb0ZOWbt7whfZ8yHRI+pLrn6/9206PTIUNmldia0M9B/E5/DLc
 203og7+5+wsQK1vvjPZFVMe00bNS3Y6K15eGbWE1ViLCWtwIDr+ORZqq2ohLuyZCVKF3
 SJXeshQhjXpmiKT3llI2miekFrqjT99sjGfmVw4ZAaZ4Nt7oIZ08pctr3CIiql/cjU2w
 f8wZoiPd8tHTyUejS0xqwfP/vgVWwTFwut5mXdUDptC0xQxFKrX/hbVYOtxpxr8HuI+5
 DZTkv6jfqm2WaEHmctpc5lkwcQqqEDJD8luPxnZEkZiQHTbaoCRyC6ecEbKU0zadmJIr
 v2IQ==
X-Gm-Message-State: ANhLgQ1ftCHQ+Tnhdohmh79rrklwjW+bMx002RKw/oLP9cuF57OZM0uz
 iZv+On+3cfliDKx9e388EdCG/4al3sw=
X-Google-Smtp-Source: APiQypJqXSCElKKtV5ZE3NYi3a88oTI00ID7TAIua/9Q+5t7PluAbQQ//W1JlyI5Ke8eCNKHs+W7kA==
X-Received: by 2002:a17:90b:3747:: with SMTP id
 ne7mr4528233pjb.181.1585668219762; 
 Tue, 31 Mar 2020 08:23:39 -0700 (PDT)
Received: from localhost.localdomain (123-195-35-41.dynamic.kbronet.com.tw.
 [123.195.35.41])
 by smtp.gmail.com with ESMTPSA id g30sm12097660pgn.40.2020.03.31.08.23.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 31 Mar 2020 08:23:39 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 dianders@chromium.org, paul.walmsley@sifive.com, palmer@dabbelt.com
Date: Tue, 31 Mar 2020 23:23:09 +0800
Message-Id: <1585668191-16287-4-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585668191-16287-1-git-send-email-vincent.chen@sifive.com>
References: <1585668191-16287-1-git-send-email-vincent.chen@sifive.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.194 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jJJ8C-00Guou-LO
X-Mailman-Approved-At: Wed, 01 Apr 2020 13:17:31 +0000
Subject: [Kgdb-bugreport] [PATCH v2 3/5] kgdb: enable arch to support XML
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
 include/linux/kgdb.h   |  9 +++++++++
 kernel/debug/gdbstub.c | 13 +++++++++++++
 lib/Kconfig.kgdb       |  5 +++++
 3 files changed, 27 insertions(+)

diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index b072aeb1fd78..ee9109d2f056 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -177,6 +177,15 @@ kgdb_arch_handle_exception(int vector, int signo, int err_code,
 			   struct pt_regs *regs);
 
 /**
+ *	arch_handle_qxfer_pkt - Handle architecture specific GDB XML packets.
+ *	@remcom_in_buffer: The buffer of the packet we have read.
+ *	@remcom_out_buffer: The buffer of %BUFMAX bytes to write a packet into.
+ */
+
+extern void
+arch_handle_qxfer_pkt(char *remcom_in_buffer, char *remcom_out_buffer);
+
+/**
  *	kgdb_call_nmi_hook - Call kgdb_nmicallback() on the current CPU
  *	@ignored: This parameter is only here to match the prototype.
  *
diff --git a/kernel/debug/gdbstub.c b/kernel/debug/gdbstub.c
index 4b280fc7dd67..d6b1b630a7e7 100644
--- a/kernel/debug/gdbstub.c
+++ b/kernel/debug/gdbstub.c
@@ -792,6 +792,19 @@ static void gdb_cmd_query(struct kgdb_state *ks)
 		}
 		break;
 #endif
+#ifdef CONFIG_ACRH_SUPPORTS_GDB_XML
+	case 'S':
+		if (!strncmp(remcom_in_buffer, "qSupported:", 11))
+			strcpy(remcom_out_buffer, arch_gdb_stub_feature);
+		break;
+	case 'X':
+		if (!strncmp(remcom_in_buffer, "qXfer:", 6))
+			arch_handle_qxfer_pkt(remcom_in_buffer,
+					      remcom_out_buffer);
+		break;
+#endif
+	default:
+		break;
 	}
 }
 
diff --git a/lib/Kconfig.kgdb b/lib/Kconfig.kgdb
index 933680b59e2d..5b586a3bba90 100644
--- a/lib/Kconfig.kgdb
+++ b/lib/Kconfig.kgdb
@@ -3,6 +3,11 @@
 config HAVE_ARCH_KGDB
 	bool
 
+# set if architecture implemented the arch_handle_qxfer_pkt function
+# to enable gdb stub to address XML packet sent from GDB.
+config ARCH_SUPPORTS_GDB_XML
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
