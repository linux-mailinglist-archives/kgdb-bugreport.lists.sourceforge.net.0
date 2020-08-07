Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C034923E701
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  7 Aug 2020 07:19:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k3unG-00010C-J1
	for lists+kgdb-bugreport@lfdr.de; Fri, 07 Aug 2020 05:19:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1k3unF-000105-QY
 for kgdb-bugreport@lists.sourceforge.net; Fri, 07 Aug 2020 05:19:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LKoQxM83Uc+FXvx6t5Ymg1IK53B/gKt39Gp0pbNTE/w=; b=DSf00zIhBrLSox5FlnUIo9iTBp
 0vXLRHmdq8n/A7jhOy5daFxPZkaWJz8Qwfy8IfwXXM3YJitecJiX9wEZL9+AWJYFUzn3gvmQUvYp2
 j+m5ELK+bQOt9gHtfZC9zI+Rd6US6KZ6OMItr8YD403Jf8qATPXJiC0WS25oUWwPDYL0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LKoQxM83Uc+FXvx6t5Ymg1IK53B/gKt39Gp0pbNTE/w=; b=M
 Rijm/ju12RUOezKwZ2r+KjSCMK7agEbvGYzMWgPkN3GYbTuOdJqz5qEcXDaQBvIKXgeYZ1wJ5BZuT
 G6Wn/upXKjXrUZurtpeHLkxR0h/MTQ3NYP6DH7huSli+7eS/0cU5PEr6A/Yw4AVd0AowiRSU1rM9D
 oe2XVJu5n7nTZOj4=;
Received: from mail-pf1-f195.google.com ([209.85.210.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k3unE-00FDkq-9C
 for kgdb-bugreport@lists.sourceforge.net; Fri, 07 Aug 2020 05:19:49 +0000
Received: by mail-pf1-f195.google.com with SMTP id a79so385471pfa.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 06 Aug 2020 22:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LKoQxM83Uc+FXvx6t5Ymg1IK53B/gKt39Gp0pbNTE/w=;
 b=VyAVOpNiqddmfKMBU5li60da/RuApY8f29CHkpTimPilQ86j/gYbLdXJ1JoEKt6vpD
 d2y9EUvtPB6CzlyDFnlal3mfMmer+GsWBqAAIygnmP1BPWq0yKdn9T5KLNJws9XbR+VJ
 GgtQ18JNlytDCtEX7K8cs1KdMErJEwTQy/v1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LKoQxM83Uc+FXvx6t5Ymg1IK53B/gKt39Gp0pbNTE/w=;
 b=WV66/S+3x3sxQ21hD/bTsHpWuKKy/QLTkitlL0FkZxqikq2FC0/4ehH+1bXAb/+Plv
 tQzuPEa9LtdG0CImA1JPGkStQ8J8yRXOzsCx0KR+oS/uw4hck4DPrUuGe2BA9mC5KsiQ
 VggtgzVDuvuxVj3QHB2XTGsEDBTyOrXcuHJoJQ1IBuCZToUzyxQyQ6mfTkxt90NeaR57
 3OxigWN63ZG8x40IIKsL09cMVCrB3T6Azy4sV75FQoyKpLFMsxZKGQYpOVVhcfpWbAQn
 HETAehQbi5iZvX0M6AjhtOWwqGa92+95aAV22a/VI61EeveARCvgNArdTgrKUv7fQ0/x
 wTGg==
X-Gm-Message-State: AOAM532srSUJs9/uqjQnIfByuDCjkSDDN8jgFn9haU/g5N4D9oAUhhko
 6Dg7wdcjUQ9CYERNrjcUzJKEiQ==
X-Google-Smtp-Source: ABdhPJyip5WtaSgO5LZF/l7/MXW9QhJe3s0OYmfhC0kSr5YBXvM+tKuZ31k0S09mlDItrxz9IXrAAQ==
X-Received: by 2002:a65:4b85:: with SMTP id t5mr10043682pgq.36.1596777575437; 
 Thu, 06 Aug 2020 22:19:35 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id r15sm11381147pfq.189.2020.08.06.22.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 22:19:34 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu,  6 Aug 2020 22:19:08 -0700
Message-Id: <20200806221904.1.I4455ff86f0ef5281c2a0cd0a4712db614548a5ca@changeid>
X-Mailer: git-send-email 2.28.0.236.gb10cc79966-goog
MIME-Version: 1.0
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.195 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.195 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k3unE-00FDkq-9C
Subject: [Kgdb-bugreport] [PATCH] serial: qcom_geni_serial: Fix recent kdb
 hang
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
Cc: kgdb-bugreport@lists.sourceforge.net, Evan Green <evgreen@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Akash Asthana <akashast@codeaurora.org>, Andy Gross <agross@kernel.org>,
 linux-serial@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Mukesh Savaliya <msavaliy@codeaurora.org>, Jiri Slaby <jirislaby@kernel.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The commit e42d6c3ec0c7 ("serial: qcom_geni_serial: Make kgdb work
even if UART isn't console") worked pretty well and I've been doing a
lot of debugging with it.  However, recently I typed "dmesg" in kdb
and then held the space key down to scroll through the pagination.  My
device hung.  This was repeatable and I found that it was introduced
with the aforementioned commit.

It turns out that there are some strange boundary cases in geni where
in some weird situations it will signal RX_LAST but then will put 0 in
RX_LAST_BYTE.  This means that the entire last FIFO entry is valid.
This weird corner case is handled in qcom_geni_serial_handle_rx()
where you can see that we only honor RX_LAST_BYTE if RX_LAST is set
_and_ RX_LAST_BYTE is non-zero.  If either of these is not true we use
BYTES_PER_FIFO_WORD (4) for the size of the last FIFO word.

Let's fix kgdb.  While at it, also use the proper #define for 4.

Fixes: e42d6c3ec0c7 ("serial: qcom_geni_serial: Make kgdb work even if UART isn't console")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/tty/serial/qcom_geni_serial.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 07b7b6b05b8b..e27077656939 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -361,11 +361,16 @@ static int qcom_geni_serial_get_char(struct uart_port *uport)
 			return NO_POLL_CHAR;
 
 		if (word_cnt == 1 && (status & RX_LAST))
+			/*
+			 * NOTE: If RX_LAST_BYTE_VALID is 0 it needs to be
+			 * treated as if it was BYTES_PER_FIFO_WORD.
+			 */
 			private_data->poll_cached_bytes_cnt =
 				(status & RX_LAST_BYTE_VALID_MSK) >>
 				RX_LAST_BYTE_VALID_SHFT;
-		else
-			private_data->poll_cached_bytes_cnt = 4;
+
+		if (private_data->poll_cached_bytes_cnt == 0)
+			private_data->poll_cached_bytes_cnt = BYTES_PER_FIFO_WORD;
 
 		private_data->poll_cached_bytes =
 			readl(uport->membase + SE_GENI_RX_FIFOn);
-- 
2.28.0.236.gb10cc79966-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
