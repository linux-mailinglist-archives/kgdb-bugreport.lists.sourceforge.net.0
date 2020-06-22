Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A671F203945
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Jun 2020 16:27:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jnNQ7-00040P-Fb
	for lists+kgdb-bugreport@lfdr.de; Mon, 22 Jun 2020 14:27:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jnNQ6-00040I-EC
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Jun 2020 14:27:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8IF9E1gKHyjaeJfo2rxkpn7RVtFle/sJ4XKWmX86Q3Q=; b=EOMOEyNbXtPGUB2U1zODjTpROR
 WsGiH7EAjj19GnpzSE7SvCSSLo4pO4dveBaBSVV5NmhOSkIGSOYX+sDx5c0BX7VuKP42V/whKBO/d
 QUC2g8gVGsLHv/F3vNGg4AutpEtzVwJ/Xt6oaAiKgbTcV1THIBJ3f1g+I7Vyhg9jhnL0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8IF9E1gKHyjaeJfo2rxkpn7RVtFle/sJ4XKWmX86Q3Q=; b=AHop+5Sb8DrdFeoiJBSyKrvwV9
 hxzidPyCYVN/5d0uvH8SAu4ILBYdkS09ot3J27JUhM2hI/QZ5LCzsXMuGRVOkk8VkLXL8sTyPGy1u
 ShWsaAjQhuGMZizkNtDW7IQ+RX/2XWy7dp7799oilQC3WMpjvRFdD9TbXxNqyDbcPOx8=;
Received: from mail-pg1-f194.google.com ([209.85.215.194])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jnNQ2-00F0Uy-M8
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Jun 2020 14:27:34 +0000
Received: by mail-pg1-f194.google.com with SMTP id e9so8208990pgo.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Jun 2020 07:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8IF9E1gKHyjaeJfo2rxkpn7RVtFle/sJ4XKWmX86Q3Q=;
 b=vnopgcIuuGUomYyixYh3vmsH/ZEfcTlDpC9WbItwt2rL5Q/fAjVXnBvbwwOoml4Xop
 A4WCt4YiyvLALgP7spO6E9WpjRI5FqApFXfKm/XTeM4GWsztkl57XMdB59ib9gjLR7zk
 akE2I/kgqYJMQGP/cAXVUxx+4PC8BFLzoLMLkQIel8iaYCBE1KVlxO0ohMYj+qR5KTbP
 yhbnqOiI0guRk7dVDMuLikFBsjozadCgYhD4WJLJCy6/RaZjdIMFrniappbpl3733COV
 /XvsPO/au4Ik/ONpHzsmRCiDPYfMGMVlJL7MFHhfFFf4iSSPJwedCqKzyzuVDR8ocHV8
 Dovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8IF9E1gKHyjaeJfo2rxkpn7RVtFle/sJ4XKWmX86Q3Q=;
 b=AnzvdjnplgcHWgdPyz16+PYWnzB1IYOeE8EaBx5D2NwLkywk7rBjaZ8h/+rRAVWstw
 WCxjeugQASVl3XjOCEN6WuJTVVtAfZdOcJhO6uuYBHoKNXI1bXVST4Vvk2I7XcqjmVZn
 sN7jVSiGWljGLhWc41KUV/Qu1EFoXyR6w2VOWkiSJyN90TZhP2W/a+m7Je3X/JvBwy2K
 y39NFv+NMN2gSVVpZACigBwoThw/+9W7i1QZEKH5QQUCq0+Y/3Gm4ffOWsyRtqqZSnDA
 6jNgxWVwoHZ/qVxNtApPLQvT9ZIVUEMCM1Gu8O+fJn0/+GGemg+hEmmKszt57etpnJg5
 Ghgw==
X-Gm-Message-State: AOAM5302RzxOfxwQB640BEB8kKlLKv/YKBVw4Lb5/bg1/x4i8RaJ64pf
 w/HuB0KZ2mbheO8uUClFUN7zraeBYmg=
X-Google-Smtp-Source: ABdhPJw1G6y/vA/2LyrBh5KKvrd/mrZs5tAwapcsLdAG5iU7VgfWzP+NKCihESo4wOGF+Pl8dkMW/A==
X-Received: by 2002:aa7:9818:: with SMTP id e24mr21368063pfl.30.1592836044694; 
 Mon, 22 Jun 2020 07:27:24 -0700 (PDT)
Received: from localhost.localdomain ([117.252.67.186])
 by smtp.gmail.com with ESMTPSA id d6sm14547939pjh.5.2020.06.22.07.27.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jun 2020 07:27:23 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net,
	linux-serial@vger.kernel.org
Date: Mon, 22 Jun 2020 19:56:18 +0530
Message-Id: <1592835984-28613-2-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592835984-28613-1-git-send-email-sumit.garg@linaro.org>
References: <1592835984-28613-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: 1.4 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.194 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.5 RCVD_IN_SORBS_WEB      RBL: SORBS: sender is an abusable web server
 [117.252.67.186 listed in dnsbl.sorbs.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jnNQ2-00F0Uy-M8
Subject: [Kgdb-bugreport] [PATCH 1/7] serial: kgdb_nmi: Allow NMI console to
 replace kgdb IO console
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
Cc: daniel.thompson@linaro.org, gregkh@linuxfoundation.org,
 jason.wessel@windriver.com, linux@armlinux.org.uk, jslaby@suse.com,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Traditionally, kgdb NMI console relied on cmdline option "console=" to
enable/disable consoles. But it didn't took into account DT/ACPI modes
which can also provide default preferred console that can be enabled
prior to kgdb NMI console. And if that default preferred console is
used for debug IO operations as well then it will lead to duplicate
consoles representing same physical serial device which in turn leads
to duplicate printk messages.

In order to avoid this duplication, we need to disable/unregister debug
IO console in case the NMI console is enabled successfully. Also, we
wouldn't like to see beginning boot messages twice, so we need to
remove flag: CON_PRINTBUFFER prior to NMI console registration.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 drivers/tty/serial/kgdb_nmi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/tty/serial/kgdb_nmi.c b/drivers/tty/serial/kgdb_nmi.c
index 6004c0c..b32c6b1 100644
--- a/drivers/tty/serial/kgdb_nmi.c
+++ b/drivers/tty/serial/kgdb_nmi.c
@@ -40,6 +40,7 @@ module_param_named(magic, kgdb_nmi_magic, charp, 0600);
 MODULE_PARM_DESC(magic, "magic sequence to enter NMI debugger (default $3#33)");
 
 static atomic_t kgdb_nmi_num_readers = ATOMIC_INIT(0);
+static struct console *orig_dbg_cons;
 
 static int kgdb_nmi_console_setup(struct console *co, char *options)
 {
@@ -352,8 +353,22 @@ int kgdb_register_nmi_console(void)
 		goto err_drv_reg;
 	}
 
+	/*
+	 * If we already have an active debug IO console, and are switching
+	 * to a NMI console, don't print everything out again, since debug IO
+	 * console, and the NMI console are the same physical device, it's
+	 * annoying to see the beginning boot messages twice.
+	 */
+	if (dbg_io_ops->cons && (dbg_io_ops->cons->flags & CON_ENABLED)) {
+		orig_dbg_cons = dbg_io_ops->cons;
+		kgdb_nmi_console.flags &= ~CON_PRINTBUFFER;
+	}
+
 	register_console(&kgdb_nmi_console);
 
+	if (orig_dbg_cons && (kgdb_nmi_console.flags & CON_ENABLED))
+		unregister_console(orig_dbg_cons);
+
 	return 0;
 err_drv_reg:
 	put_tty_driver(kgdb_nmi_tty_driver);
@@ -373,6 +388,9 @@ int kgdb_unregister_nmi_console(void)
 	if (ret)
 		return ret;
 
+	if (orig_dbg_cons)
+		register_console(orig_dbg_cons);
+
 	ret = tty_unregister_driver(kgdb_nmi_tty_driver);
 	if (ret)
 		return ret;
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
