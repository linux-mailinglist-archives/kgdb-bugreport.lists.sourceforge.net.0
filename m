Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F3754203A02
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Jun 2020 16:52:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jnNob-00007x-Pe
	for lists+kgdb-bugreport@lfdr.de; Mon, 22 Jun 2020 14:52:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jnNoa-00007l-UV
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Jun 2020 14:52:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M9KwMzs626zZhBtIoTQs5efdkplmNJ79hSzl8cSVNjw=; b=gTP6mcmV0fT19IwHEOo+e+M5WZ
 oBBc9G9ZeWfKsNyju86J5A9Kh3G/NDcJ4lsejt3WOCFTiXhLRIcyr5I6Q6CWpPpFBhjBqLxE8US0e
 /H0IeqebFAN3TTZibFE3yMiFbf/fO8T7d/UA7bt5r8laSkAEsXhezohqYEc8otW/AKlc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M9KwMzs626zZhBtIoTQs5efdkplmNJ79hSzl8cSVNjw=; b=aHbSwiieoyDhg7zlqa3S27KP52
 I+59jWd33tKG4rJePmX0+ywFmAjhKD2pIfnn2DAwFegfr71qHssNjwljOqkKVpAXkkvVwXmZ/JFhz
 x3XFB8zDgjHGjC/xvC2NGezBHqMswZ3SqyNpcnHl4UmyehPyr7WCmviYa/WPYUu6sXpo=;
Received: from mail-vs1-f67.google.com ([209.85.217.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jnNoZ-00C1cT-8Q
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Jun 2020 14:52:52 +0000
Received: by mail-vs1-f67.google.com with SMTP id j13so9800484vsn.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Jun 2020 07:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=M9KwMzs626zZhBtIoTQs5efdkplmNJ79hSzl8cSVNjw=;
 b=fcYOxIUyQqvxk/LMxj5k2PcHWbKksWlVM0RADhm7nGAokdEUmwV3EEiZC6qY8FZN+u
 MXoiD9Bl8uV3mE4dflId5Ysj9kk2DyS+ixwUWTwMxgQNlEF/UXTDXHxh7aeIfq/mou+U
 eOEgNlbrFUBNwfhMfJmEyGzg5fmJfkUD5+UTEteGBQmEZK7I1tsSoxz7idIIF4PWOgEv
 3wQpxAZvdSHhEhomUs3Z4VP2UfDdFTNS9ukNUxnLQOoybV0TbZMI9blZV8rUJ1CsWUdM
 EJwzGZlCgI6Rtzeeiy5wd0ZheSlc3cyB8kuXh84pgLq/xOC7zPeMMPf0jJb4+LZ6QsuT
 hT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=M9KwMzs626zZhBtIoTQs5efdkplmNJ79hSzl8cSVNjw=;
 b=SFcGHTHa7ac4l48ksE3hkGcZ983BITfgSPXM3s4DRPPELbBLFWiqs0WNZ50ydwJ9wO
 7L6pigKaRMoiX2JUjQloZgBdCL7Zpp61d93bwlX54UuMNIfEMec7pwfIxS7zjh7+nw/J
 lo9RYY8lv3kahmnFdsLAvB3qbUfOJgGia2rJ1YutYcHXfmqn9UJ1/jqWGFcw+W+9IoOw
 wE86NJph+XclaXxYxVzCLmhkq0ytZ+B9FCfpe+BjPPPc0S25hyZ8tMbgvvUixDBMzKXY
 h27EKYt49cdXOZt58/w0vw595/oR4xacaoWwiGtecMxoI4WPYoZF1Oggyl6a5RAzpCwr
 BWtw==
X-Gm-Message-State: AOAM530GpGLfHdb+odq2PvUs65l6r8cfpMeZaoOfkE0XDbbrhuxu0qnd
 hhoyA9bwe62L6p4bkt9INHk9URNkRLQ=
X-Google-Smtp-Source: ABdhPJxdk4/xczBSB9mmZ7kd/CjrWcQEW1E+5kTeVyzPqHBNPaFgJntiHv8R1qUiKMAh8yK0vGiMnA==
X-Received: by 2002:a17:902:d903:: with SMTP id
 c3mr18839486plz.229.1592836070328; 
 Mon, 22 Jun 2020 07:27:50 -0700 (PDT)
Received: from localhost.localdomain ([117.252.67.186])
 by smtp.gmail.com with ESMTPSA id d6sm14547939pjh.5.2020.06.22.07.27.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jun 2020 07:27:49 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net,
	linux-serial@vger.kernel.org
Date: Mon, 22 Jun 2020 19:56:23 +0530
Message-Id: <1592835984-28613-7-git-send-email-sumit.garg@linaro.org>
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
 trust [209.85.217.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jnNoZ-00C1cT-8Q
Subject: [Kgdb-bugreport] [PATCH 6/7] serial: amba-pl011: Implement
 poll_get_irq() interface
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

Support kgdb NMI console feature via implementing poll_get_irq()
interface. This will allow usage of RX interrupts to support kgdb entry
while serial device is operating in polling mode.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 drivers/tty/serial/amba-pl011.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index c010f63..d620d12 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -1637,6 +1637,16 @@ static void pl011_put_poll_char(struct uart_port *port,
 	pl011_write(ch, uap, REG_DR);
 }
 
+static int pl011_get_poll_irq(struct uart_port *port)
+{
+	struct uart_amba_port *uap =
+	    container_of(port, struct uart_amba_port, port);
+
+	pl011_write(UART011_RTIM | UART011_RXIM, uap, REG_IMSC);
+
+	return uap->port.irq;
+}
+
 #endif /* CONFIG_CONSOLE_POLL */
 
 static int pl011_hwinit(struct uart_port *port)
@@ -2145,6 +2155,7 @@ static const struct uart_ops amba_pl011_pops = {
 	.poll_init     = pl011_hwinit,
 	.poll_get_char = pl011_get_poll_char,
 	.poll_put_char = pl011_put_poll_char,
+	.poll_get_irq  = pl011_get_poll_irq,
 #endif
 };
 
@@ -2176,6 +2187,7 @@ static const struct uart_ops sbsa_uart_pops = {
 	.poll_init     = pl011_hwinit,
 	.poll_get_char = pl011_get_poll_char,
 	.poll_put_char = pl011_put_poll_char,
+	.poll_get_irq  = pl011_get_poll_irq,
 #endif
 };
 
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
