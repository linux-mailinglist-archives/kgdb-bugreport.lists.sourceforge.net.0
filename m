Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C6615C101
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 13 Feb 2020 16:06:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1j2G4K-0005Bn-Kr
	for lists+kgdb-bugreport@lfdr.de; Thu, 13 Feb 2020 15:06:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1j2G4J-0005Bg-EH
 for kgdb-bugreport@lists.sourceforge.net; Thu, 13 Feb 2020 15:06:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ljdX2toI1glkUCHAbgskAX4FstAA5OW+os6LVO25kAo=; b=GXLvylUwXnlXwAPHyWSIRCyC1x
 nQr1ZxOSAXbMqrPZpqlJF11/JlWO9tvin/KWRPCI8OnjsYZxR7EEjrcbZQDcC9Jdonj+sqJBKVKuE
 25q8SPZbMshEaqNLFd7JuJtrCKjDv+98MBJ9tOIkueJ3ft6LUpYy9b635sczzfnWH2VY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ljdX2toI1glkUCHAbgskAX4FstAA5OW+os6LVO25kAo=; b=H
 4fEW+QePkuoPoOCiUUi2yjGoayiPC8H0ais/Ax6Pt853vqM0A1czNxcVtsLNYhTGb9Qfe8tvzP2ew
 in+TQ4e8Vd85rhVFcHR0F7/TKQApkEYt9ShA98bgUldQ/2KB0yz657tbivDy34fOPBOFgF4WN/f/B
 3N0uAHBop/oP4sK0=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1j2G4F-00BXSp-7k
 for kgdb-bugreport@lists.sourceforge.net; Thu, 13 Feb 2020 15:06:19 +0000
Received: by mail-wr1-f68.google.com with SMTP id z7so7067018wrl.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 13 Feb 2020 07:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ljdX2toI1glkUCHAbgskAX4FstAA5OW+os6LVO25kAo=;
 b=xIThK0kuWRRu5Y/bTutWxrzpIW+BSCNi0v8BmUX+XuR5+Ft7S3ZZCcvzk6P/neUQ70
 VjqW+5MupHA0wCCA4rVskUR1a/9n79Jd5MtHw1ofG5qF+24seGbyfRkAx6SNTQdgHSkc
 cJLcT3fqoJhU2hvbFuOUfReP6NWnGD+vhSk5d4wtsamH3/+hQspt4IlCNTwleMs+KKyq
 ImjrTLR/wyrXE+P8ar9XkOjLTVUEJelIi8xWuhyWFx9hIWXwCM28ndOv7DWlJSVY0VqG
 /giR5bIHISKcVY0xbBMxojHvxSKEIbm5K30TRELmiDY9yaFwAE8VKpeU/NUxyDWQVWAc
 B8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ljdX2toI1glkUCHAbgskAX4FstAA5OW+os6LVO25kAo=;
 b=suA0XqSp/plDfA5xiZOnVbqqwsOmDP18/74pQjZFkdwMxzVm7TGFcYUsjzpEdf/zRi
 geud8UZ505sHqAPfit2cb9sVOtSzCCqQ8lztr8N29IVSCW97WZBS08FpcfTUGVjgyXIl
 zNklbylbyQ7M6rImz3bMjTA3Y45T6G9tDWWHE4WxDKCpLSlrejkIP6jv6EQemUnZziqz
 /ObDVZQoDwD61EywpgixDPMhShuWsrmJmcV1MNLlHjH5j6LUmlpQTpVn1LW5HP+BhVRk
 gGDaA7WsqyxjSmaOuljVWJJ6AXMVXGxFaGanVUzAMjutGV+mZf3gAqvUYNeWb2clk/3K
 8KPw==
X-Gm-Message-State: APjAAAWkvLgINFjZA2qojnGuEwymI0JtmGUcvqktE/+r7fbDOAGHXOeA
 b6/SrZ6ryzKu6JTFQyK/K+ovXg==
X-Google-Smtp-Source: APXvYqxlbxmp9sQUBchL7xCXNDeCu6p5vWmmPGNO5ZyJ0If8Armv9gfRQLVqlWf476Igqo9LNYFNbA==
X-Received: by 2002:adf:9c8c:: with SMTP id d12mr21750911wre.404.1581606368580; 
 Thu, 13 Feb 2020 07:06:08 -0800 (PST)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id m9sm3162376wrx.55.2020.02.13.07.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 07:06:08 -0800 (PST)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>
Date: Thu, 13 Feb 2020 15:05:53 +0000
Message-Id: <20200213150553.313596-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1j2G4F-00BXSp-7k
Subject: [Kgdb-bugreport] [PATCH] kdb: Eliminate strncpy() warnings by
 replacing with strscpy()
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 patches@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Currently the code to manage the kdb history buffer uses strncpy() to
copy strings to/and from the history and exhibits the classic "but
nobody ever told me that strncpy() doesn't always terminate strings"
bug. Modern gcc compilers recognise this bug and issue a warning.

In reality these calls will only abridge the copied string if kdb_read()
has *already* overflowed the command buffer. Thus the use of counted
copies here is only used to reduce the secondary effects of a bug
elsewhere in the code.

Therefore transitioning these calls into strscpy() (without checking
the return code) is appropriate.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/kdb/kdb_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index ba12e9f4661e..a4641be4123c 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -1102,12 +1102,12 @@ static int handle_ctrl_cmd(char *cmd)
 	case CTRL_P:
 		if (cmdptr != cmd_tail)
 			cmdptr = (cmdptr-1) % KDB_CMD_HISTORY_COUNT;
-		strncpy(cmd_cur, cmd_hist[cmdptr], CMD_BUFLEN);
+		strscpy(cmd_cur, cmd_hist[cmdptr], CMD_BUFLEN);
 		return 1;
 	case CTRL_N:
 		if (cmdptr != cmd_head)
 			cmdptr = (cmdptr+1) % KDB_CMD_HISTORY_COUNT;
-		strncpy(cmd_cur, cmd_hist[cmdptr], CMD_BUFLEN);
+		strscpy(cmd_cur, cmd_hist[cmdptr], CMD_BUFLEN);
 		return 1;
 	}
 	return 0;
@@ -1314,7 +1314,7 @@ static int kdb_local(kdb_reason_t reason, int error, struct pt_regs *regs,
 		if (*cmdbuf != '\n') {
 			if (*cmdbuf < 32) {
 				if (cmdptr == cmd_head) {
-					strncpy(cmd_hist[cmd_head], cmd_cur,
+					strscpy(cmd_hist[cmd_head], cmd_cur,
 						CMD_BUFLEN);
 					*(cmd_hist[cmd_head] +
 					  strlen(cmd_hist[cmd_head])-1) = '\0';
@@ -1324,7 +1324,7 @@ static int kdb_local(kdb_reason_t reason, int error, struct pt_regs *regs,
 				cmdbuf = cmd_cur;
 				goto do_full_getstr;
 			} else {
-				strncpy(cmd_hist[cmd_head], cmd_cur,
+				strscpy(cmd_hist[cmd_head], cmd_cur,
 					CMD_BUFLEN);
 			}


base-commit: bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9
--
2.23.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
