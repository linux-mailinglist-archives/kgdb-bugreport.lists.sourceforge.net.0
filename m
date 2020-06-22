Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E095E203946
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Jun 2020 16:27:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jnNQA-000410-J6
	for lists+kgdb-bugreport@lfdr.de; Mon, 22 Jun 2020 14:27:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jnNQ9-00040o-7I
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Jun 2020 14:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vwFsGBHaAVO/O+/Qurpo2lVEh+kEhysHr8M/+K/fxoc=; b=a5uBLbXcaE7gtnxAcVt1uSNiLh
 UcRy6ilgkmNb3HqxMXrAIIfmTnN44emIrwyixCYFFL8vy+JyqpLZrTua8i/jEORfMODsfB2D+BLd9
 zsqe0UsfxSMpcikFICR9x4ERv5J+bzGlRMm9fYu2GwsPUIxPmURTJy6P1bcn9Pwixj7Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vwFsGBHaAVO/O+/Qurpo2lVEh+kEhysHr8M/+K/fxoc=; b=itbRv080kzNb9dyeOT5VH5fBz9
 x3iMvtRcZfqZGNuK8FqD8PVSJcavKCSe/ZBgpEgtVqALD0W1r+UFCQ4OQGbzCAibP/TIERgm3aGhe
 W18saoJQrl7QCpqx+lpmj1AV5q5juavEeXPj9IUb8nujQ1SNsWy9YL/PSpx+H4gWd6cI=;
Received: from mail-pg1-f194.google.com ([209.85.215.194])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jnNQ7-00F0V5-VG
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Jun 2020 14:27:37 +0000
Received: by mail-pg1-f194.google.com with SMTP id l63so8204577pge.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Jun 2020 07:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vwFsGBHaAVO/O+/Qurpo2lVEh+kEhysHr8M/+K/fxoc=;
 b=A0H4lXeSqd1TcxTG4LkROpY5Ka7b89dAFnokSllDR68dqft5Eb3Sn+vycp/qtrhYPY
 Zg19eLNhtlN0dlmyu1JXx/lZTscE50s/df/wBFUmF5h0/CYagKoI7JXYmu8c/LiH9aWW
 c51dblKL90Tzo4xj50Bfq6fyy9fWKaJKxiwUejKcV6chfaeKNl6slT2CtykiK81hqv4d
 2yLtdAYPMo8a6blB1QahexeTWQd6h0+I/PgnWrAhNe34KueKPg9k3NcquzAXJeYN77gJ
 MO2fh80EBgSVbP51lQ9PRKP9SD5h4V1Varsf+rDfhLRjJwdFtwfECRh2Xk9zwBi2IGHW
 azbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vwFsGBHaAVO/O+/Qurpo2lVEh+kEhysHr8M/+K/fxoc=;
 b=WAqqXybQuq608LlSsBK5JEgdVnU+R/hTXjQMdGwYuNXsIdU2wVoMbdyM6SvdwqfMR4
 YCTb2oI0vY/1je9V5B3z2KrBMthUzBq6JXRQ+p4Jx8NKjfG71FjjJk4/IwouNYYAbgbO
 EenGtQ7wHIIrOZc5TfTU9EimKluAb5MzWc/09mrOomm6Abw57W9UWlRgX0NhRvpWlVY/
 YOwmqDRhRZgFrP02Gms5stKgp6W+WBR3RWX5lFRleOdk5HphtyeQ29hFRNukFJjLsgYq
 /2DT0g0RqGZVgGLhEoIbYwsNq3YpEvK7uMZ7BciWKzPZzY4rm8o9T0cL4PFjEwcLJXqx
 k9JQ==
X-Gm-Message-State: AOAM533Ai5CPuZZATYNtKiL7nJQUrqZ+6uY4hNroOMZnhyXhfxjQOvzm
 vv7yyeSzUYIhv6JxsPbPXjKtTeA7xnA=
X-Google-Smtp-Source: ABdhPJxGh0TYex4nPoXDAnP2VnSgxXNcHKtzTjFNB4KOkRhgrpCJ6SxFNH3mr4sruco8M3DapOiqzg==
X-Received: by 2002:a63:d318:: with SMTP id b24mr12063898pgg.403.1592836050027; 
 Mon, 22 Jun 2020 07:27:30 -0700 (PDT)
Received: from localhost.localdomain ([117.252.67.186])
 by smtp.gmail.com with ESMTPSA id d6sm14547939pjh.5.2020.06.22.07.27.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jun 2020 07:27:29 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net,
	linux-serial@vger.kernel.org
Date: Mon, 22 Jun 2020 19:56:19 +0530
Message-Id: <1592835984-28613-3-git-send-email-sumit.garg@linaro.org>
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
 1.5 RCVD_IN_SORBS_WEB      RBL: SORBS: sender is an abusable web server
 [117.252.67.186 listed in dnsbl.sorbs.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.194 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.194 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jnNQ7-00F0V5-VG
Subject: [Kgdb-bugreport] [PATCH 2/7] tty: serial: Add poll_get_irq() to the
 polling interface
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

From: Daniel Thompson <daniel.thompson@linaro.org>

Add new API: poll_get_irq() to the polling interface in order for user
of polling interface to retrieve allocated IRQ corresponding to
underlying serial device.

Although, serial interface still works in polling mode but interrupt
associated with serial device can be leveraged for special purposes like
debugger(kgdb) entry.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 drivers/tty/serial/serial_core.c | 18 ++++++++++++++++++
 include/linux/serial_core.h      |  1 +
 include/linux/tty_driver.h       |  1 +
 3 files changed, 20 insertions(+)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 66a5e2f..1bb033c 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -2470,6 +2470,23 @@ static void uart_poll_put_char(struct tty_driver *driver, int line, char ch)
 	port->ops->poll_put_char(port, ch);
 	uart_port_deref(port);
 }
+
+static int uart_poll_get_irq(struct tty_driver *driver, int line)
+{
+	struct uart_driver *drv = driver->driver_state;
+	struct uart_state *state = drv->state + line;
+	struct uart_port *port;
+	int ret = -ENODEV;
+
+	port = uart_port_ref(state);
+	if (port && port->ops->poll_get_irq) {
+		ret = port->ops->poll_get_irq(port);
+		uart_port_deref(port);
+	}
+
+	return ret;
+}
+
 #endif
 
 static const struct tty_operations uart_ops = {
@@ -2505,6 +2522,7 @@ static const struct tty_operations uart_ops = {
 	.poll_init	= uart_poll_init,
 	.poll_get_char	= uart_poll_get_char,
 	.poll_put_char	= uart_poll_put_char,
+	.poll_get_irq	= uart_poll_get_irq,
 #endif
 };
 
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 92f5eba..8b132e6 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -78,6 +78,7 @@ struct uart_ops {
 	int		(*poll_init)(struct uart_port *);
 	void		(*poll_put_char)(struct uart_port *, unsigned char);
 	int		(*poll_get_char)(struct uart_port *);
+	int		(*poll_get_irq)(struct uart_port *);
 #endif
 };
 
diff --git a/include/linux/tty_driver.h b/include/linux/tty_driver.h
index 3584462..d6da5c5 100644
--- a/include/linux/tty_driver.h
+++ b/include/linux/tty_driver.h
@@ -295,6 +295,7 @@ struct tty_operations {
 	int (*poll_init)(struct tty_driver *driver, int line, char *options);
 	int (*poll_get_char)(struct tty_driver *driver, int line);
 	void (*poll_put_char)(struct tty_driver *driver, int line, char ch);
+	int (*poll_get_irq)(struct tty_driver *driver, int line);
 #endif
 	int (*proc_show)(struct seq_file *, void *);
 } __randomize_layout;
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
