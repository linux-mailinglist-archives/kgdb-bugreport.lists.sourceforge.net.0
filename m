Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E4ECC20399E
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Jun 2020 16:35:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jnNY0-0004SN-NO
	for lists+kgdb-bugreport@lfdr.de; Mon, 22 Jun 2020 14:35:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jnNXz-0004SC-It
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Jun 2020 14:35:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q8XZGlRV/H7ipjUMwZ0R6upcC6zi/GhiQnizl6ayNWQ=; b=BTJxbcslSn/fg17me9BlHLSzd1
 jbJfDPpbsxO8mS4Zf4V93YhJcm2AiQF2iwpRrI6ItWWJj8lQZt5BmbFDkylklBIGGfa0+zXGjnfnc
 BWIE1CJoeTzlgaiq2yK79B0V0SumfWNfVMjhIo7awqlB+yBqTlDLqsSc2GW0xrWcgB7k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q8XZGlRV/H7ipjUMwZ0R6upcC6zi/GhiQnizl6ayNWQ=; b=UKmV8GyXGBFV2fAJGr5ylX00cv
 LwjwNf/RdGomnY2GaPcPYb3z4QchY6rtMYSFVpNkF8wXXTp561thCeozLpRZ/cP89W9JX55v7d2xs
 k0jiOz5YyuvCi1bA2AsJMpQ2UctM+TzHbT+QFVTK8tQp2LXATVUQvLQnoLk9ABeqS9bs=;
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jnNXx-00F0nk-CS
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Jun 2020 14:35:43 +0000
Received: by mail-oi1-f196.google.com with SMTP id a3so15809068oid.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Jun 2020 07:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Q8XZGlRV/H7ipjUMwZ0R6upcC6zi/GhiQnizl6ayNWQ=;
 b=iES2Z3LS/+1ufp5YulU7Lewvw1bchggk2aWycD2ouwUfDqw/J2BDmhkYLoA5Q8Xi1/
 czE87Id/eTsr/WIJUHU8BJT+s05ule9+LYv0Ido5T4GknU8qZXkBGUNrJUw9Yoc9s4/b
 GbKx6DlF9lfyzRTu+u41x/JFhfpsQDL13xVlQtBdo9b5QcM3gFxunzDEApVgBt2ZCiMC
 fe4kGGgabD666+6T0pGDqHa2rTr0hbLHGBP9dQ91Z9MHTbd+skiPXa44ljD14bUyQwDe
 IqyvhXNM6ncGGDSSPex+2Zmrr3VIqDY+mSqst1UwK3XIJ5tQNVugk+49gE/f2ylISQlv
 Zfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Q8XZGlRV/H7ipjUMwZ0R6upcC6zi/GhiQnizl6ayNWQ=;
 b=tE41n5Jlejl3tbT41bzs2YwlNMgMjYhGZ5x8dT3ymlW1YfxWvxogYpVN6Z0Cw5sc/A
 ywgwS0orRZZ4ET7P2jO+V7bYOpGsb+TKJEveBOQIsmVYqfOG7WLU8mrWVHWqeziMl099
 j4XWDgysLUA5p7+MOhSZTghF9nTYEfumqqm2EjE4P+XEivkeQdQMrIQTL2JyBBNiVpYU
 6S3qvSyniKFjgWJpNS7zzddcIi+FyhDmfqA9s6glr6oMRhi5vS4e1JaIUf+4FStTZQ49
 9rqJ7CzKCTi1bWDvgnVS/X/lfpJjSjf+iYljCEpCuErPv5sRnB6zge4ubz23Di5VO/Pf
 96KA==
X-Gm-Message-State: AOAM531uHf1a0+KouNtbxsea+IzaRzWSC32IRjSwnfNNnGDpMHvUFAqm
 8HukrTuw8AWx+xS7De17RvgIMhlSCko=
X-Google-Smtp-Source: ABdhPJwTKZ4S3rwJvAgQzJ9r2GZApOT49IPaauL4XH7I7OZbzqclPlcDPAUZnlz4ECuEmfHBSCn8JQ==
X-Received: by 2002:a17:90a:36cf:: with SMTP id
 t73mr19089365pjb.100.1592836065367; 
 Mon, 22 Jun 2020 07:27:45 -0700 (PDT)
Received: from localhost.localdomain ([117.252.67.186])
 by smtp.gmail.com with ESMTPSA id d6sm14547939pjh.5.2020.06.22.07.27.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jun 2020 07:27:44 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net,
	linux-serial@vger.kernel.org
Date: Mon, 22 Jun 2020 19:56:22 +0530
Message-Id: <1592835984-28613-6-git-send-email-sumit.garg@linaro.org>
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.196 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.196 listed in wl.mailspike.net]
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jnNXx-00F0nk-CS
Subject: [Kgdb-bugreport] [PATCH 5/7] serial: 8250: Implement poll_get_irq()
 interface
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

Support kgdb NMI console feature via implementing poll_get_irq()
interface. This will allow usage of RX interrupts to support kgdb entry
while serial device is operating in polling mode.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 drivers/tty/serial/8250/8250_port.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index f77bf82..1473b1a 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -2138,6 +2138,21 @@ static void serial8250_put_poll_char(struct uart_port *port,
 	serial8250_rpm_put(up);
 }
 
+static int serial8250_get_poll_irq(struct uart_port *port)
+{
+	unsigned int ier;
+	struct uart_8250_port *up = up_to_u8250p(port);
+
+	serial8250_rpm_get(up);
+
+	ier = serial_port_in(port, UART_IER);
+	ier |= UART_IER_RLSI | UART_IER_RDI;
+	serial_port_out(port, UART_IER, ier);
+
+	serial8250_rpm_put(up);
+	return port->irq;
+}
+
 #endif /* CONFIG_CONSOLE_POLL */
 
 int serial8250_do_startup(struct uart_port *port)
@@ -3141,6 +3156,7 @@ static const struct uart_ops serial8250_pops = {
 #ifdef CONFIG_CONSOLE_POLL
 	.poll_get_char = serial8250_get_poll_char,
 	.poll_put_char = serial8250_put_poll_char,
+	.poll_get_irq  = serial8250_get_poll_irq,
 #endif
 };
 
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
