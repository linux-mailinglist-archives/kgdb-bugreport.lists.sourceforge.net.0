Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAB1741923
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 28 Jun 2023 21:58:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qEbJ7-0006zi-BT
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 28 Jun 2023 19:58:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qEbJ2-0006zb-1P
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 28 Jun 2023 19:58:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SLKKj3K4u0AlIAtmQW7z5se9epOJGry5f3WiL2g4NwY=; b=HtHFVSBho7a0Gv27HuiDUgZkXf
 g/QSiBxvbRqqtfq4FW2weHSNHddYa/aoRjdvTnhjKQULF5mmFgwK2u7gz33cJM+0mFLxVQFwUNaxo
 d6eiBKgUhN+eEXFSGpsdR42rziL9RjnmHwhQHJbWxrCd69FColsHkxmfTaAOQrKTG4y8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=SLKKj3K4u0AlIAtmQW7z5se9epOJGry5f3WiL2g4NwY=; b=B
 s0v3MYR/VgbtHcC2BxiBe6a8bcf6hmegzDg/TQ6AANrozIlYwsnRfrbdK68yLG6z8ETVoA5EJkJWg
 7CMOB3kvqDIe8lPTXRsRUxS70n3J5PxWq5/r2L5jTiNFlvT4EDHqUCm5A4yzWwDmAL4EGivyu4m54
 lxRpW7vKJfRUCZf4=;
Received: from mail-pg1-f176.google.com ([209.85.215.176])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qEbJ1-000Tf6-5b for kgdb-bugreport@lists.sourceforge.net;
 Wed, 28 Jun 2023 19:58:24 +0000
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-55adfa61199so58951a12.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 28 Jun 2023 12:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1687982297; x=1690574297;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SLKKj3K4u0AlIAtmQW7z5se9epOJGry5f3WiL2g4NwY=;
 b=bX9n4EZZyTbXN54Rp0GUhOYll5IXE//1a0nNjN2h20oHk4WN/oIlsZWQFuTtDjNB3s
 a0ls74kLCHwip1lHi8qogxSWcaGBS6fcnDHDR26NY29EEYazFE7nYZEwDlzaY4KmCu1z
 iN9/b9wlgfLjIXCZRzzSwOVfWJtLNKQEP06VI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687982297; x=1690574297;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SLKKj3K4u0AlIAtmQW7z5se9epOJGry5f3WiL2g4NwY=;
 b=OvOzJZj5V+vcAUwE4Gil7sgCqnXHnzvcy1ZuBXLYjnXHQPTgHjqWWA9vG+CJmoUznj
 NVOjBbR4xzmlOSCN0Fjtva2EOh3EZ3ZdZoT5Owc+onlNQatRUFFJaKrCayqls4l0AvFK
 9Zs3oCBMLOavrWnmqMa68MSub8P1OGl496KRi6/lmrxWWvwbJpdofo0yrKGkCnHN94VM
 m8Gx6eFA+j41J0Y8nrpW4NR7bgmXw4jxnAtk2hnkvu4tU+CLSC+GY0IGm4LfvQHxw7EF
 RMAQ/wb7JUemNa5wg8NFaDzQ7FJB/iz5k/ZWjn4rt46iZ9uS/vhnZ8ODe1e/6YBEE6qn
 nd8Q==
X-Gm-Message-State: AC+VfDzTxMknKvvduT2CF2qKlsPff6Vpuo38wqW3iyHCdB6OUQIt74+2
 KczEk6bbYMdLBoQq8PwEaIWg2A==
X-Google-Smtp-Source: ACHHUZ5TLdkXmDvbkiEIedIWvx1hwus+8KkOIvcmR/GosTyB+JZbqCpMg+YoO6VmeXjJk4WpAJVCQA==
X-Received: by 2002:a17:90a:930f:b0:262:ebb9:dd59 with SMTP id
 p15-20020a17090a930f00b00262ebb9dd59mr9131691pjo.20.1687982297575; 
 Wed, 28 Jun 2023 12:58:17 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:1228:a4c5:d742:666b])
 by smtp.gmail.com with ESMTPSA id
 nw13-20020a17090b254d00b00262ff206931sm5040108pjb.42.2023.06.28.12.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 12:58:16 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Date: Wed, 28 Jun 2023 12:56:17 -0700
Message-ID: <20230628125612.1.I5cc6c3d916195f5bcfdf5b75d823f2037707f5dc@changeid>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The main kdb command parser only handles CR (ASCII 13 AKA
 '\r') today, but not LF (ASCII 10 AKA '\n'). That means that the kdb command
 parser can handle terminals that send just CR or that send CR+LF [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.176 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.176 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qEbJ1-000Tf6-5b
Subject: [Kgdb-bugreport] [PATCH] kdb: Handle LF in the command parser
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
Cc: Petr Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Aaron Tomlin <atomlin@atomlin.com>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The main kdb command parser only handles CR (ASCII 13 AKA '\r') today,
but not LF (ASCII 10 AKA '\n'). That means that the kdb command parser
can handle terminals that send just CR or that send CR+LF but can't
handle terminals that send just LF.

The fact that kdb didn't handle LF in the command parser tripped up a
tool I tried to use with it. Specifically, I was trying to send a
command to my device to resume it from kdb using a ChromeOS tool like:
  dut-control cpu_uart_cmd:"g"
That tool only terminates lines with LF, not CR+LF.

Arguably the ChromeOS tool should be fixed. After all, officially kdb
seems to be designed such that CR+LF is the official line ending
transmitted over the wire and that internally a line ending is just
'\n' (LF). Some evidence:
* uart_poll_put_char(), which is used by kdb, notices a '\n' and
  converts it to '\r\n'.
* kdb functions specifically use '\r' to get a carriage return without
  a newline. You can see this in the pager where kdb will write a '\r'
  and then write over the pager prompt.

However, all that being said there's no real harm in accepting LF as a
command terminator in the kdb parser and doing so seems like it would
improve compatibility. After this, I'd expect that things would work
OK-ish with a remote terminal that used any of CR, CR+LF, or LF as a
line ending. Someone using CR as a line ending might get some ugliness
where kdb wasn't able to overwrite the last line, but basic commands
would work. Someone using just LF as a line ending would probably also
work OK.

A few other notes:
- It can be noted that "bash" running on an "agetty" handles LF as a
  line termination with no complaints.
- Historically, kdb's "pager" actually handled either CR or LF fine. A
  very quick inspection would make one think that kdb's pager actually
  could have paged down two lines instead of one for anyone using
  CR+LF, but this is generally avoided because of kdb_input_flush().
- Conceivably one could argue that some of this special case logic
  belongs in uart_poll_get_char() since uart_poll_put_char() handles
  the '\n' => '\r\n' conversion. I would argue that perhaps we should
  eventually do the opposite and move the '\n' => '\r\n' out of
  uart_poll_put_char(). Having that conversion at such a low level
  could interfere if we ever want to transfer binary data. In
  addition, if we truly made uart_poll_get_char() the inverse of
  uart_poll_put_char() it would convert back to '\n' and (ironically)
  kdb's parser currently only looks for '\r' to find the end of a
  command.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/debug/kdb/kdb_io.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 5c7e9ba7cd6b..813cb6cf72d6 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -131,6 +131,7 @@ char kdb_getchar(void)
 	int escape_delay = 0;
 	get_char_func *f, *f_prev = NULL;
 	int key;
+	static bool last_char_was_cr;
 
 	for (f = &kdb_poll_funcs[0]; ; ++f) {
 		if (*f == NULL) {
@@ -149,6 +150,18 @@ char kdb_getchar(void)
 			continue;
 		}
 
+		/*
+		 * The caller expects that newlines are either CR or LF. However
+		 * some terminals send _both_ CR and LF. Avoid having to handle
+		 * this in the caller by stripping the LF if we saw a CR right
+		 * before.
+		 */
+		if (last_char_was_cr && key == '\n') {
+			last_char_was_cr = false;
+			continue;
+		}
+		last_char_was_cr = (key == '\r');
+
 		/*
 		 * When the first character is received (or we get a change
 		 * input source) we set ourselves up to handle an escape
@@ -244,7 +257,8 @@ static char *kdb_read(char *buffer, size_t bufsize)
 			*cp = tmp;
 		}
 		break;
-	case 13: /* enter */
+	case 10: /* linefeed */
+	case 13: /* carriage return */
 		*lastchar++ = '\n';
 		*lastchar++ = '\0';
 		if (!KDB_STATE(KGDB_TRANS)) {
-- 
2.41.0.162.gfafddb0af9-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
