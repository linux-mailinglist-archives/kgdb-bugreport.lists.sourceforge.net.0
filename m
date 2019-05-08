Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7D017388
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  8 May 2019 10:18:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hOHmx-0004v7-UA
	for lists+kgdb-bugreport@lfdr.de; Wed, 08 May 2019 08:18:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <Wenlin.Kang@windriver.com>) id 1hOC2N-0005se-20
 for kgdb-bugreport@lists.sourceforge.net; Wed, 08 May 2019 02:10:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QGsRVc3/99GVHG/ZbFpTWRXq1PKrFnhfP2xrLtPINNk=; b=HUYSm8Hnl0g3G/TgJUp9ovSbaD
 qZKTL2fLuRrG3aK90bFaMQIDSCfjoHu0/fDK125stK6QaDH+H7KHh1F+mM1ViS3nDXJm0LlJ1EbvZ
 FpNliatS7EGgoyDgFu2xv9pXMf87ZimzgzXr/TJMvB5FBhtuCFT2cCNCPByMPvcOd8Bo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QGsRVc3/99GVHG/ZbFpTWRXq1PKrFnhfP2xrLtPINNk=; b=n
 P67L0mMIITgQ/c2L+JHrOMtOXzaAKni24gvSFKtxqagiP+CHdxN0NB8OAhSbxPg+Tu3iN7eOkHRKl
 2GkxogEqMHq/3pXqDyr96j3RWtrrK8lwAO5+Yq4Gf7yfSeIOgKPFe/InTmbqEyctrVBkAIOb8hni0
 q/yndfdkn9Su/iv0=;
Received: from mail.windriver.com ([147.11.1.11])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.1:ECDHE-RSA-AES256-SHA:256) (Exim 4.90_1) id 1hOC2J-009NZv-7C
 for kgdb-bugreport@lists.sourceforge.net; Wed, 08 May 2019 02:10:26 +0000
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
 by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x482AFAE015100
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Tue, 7 May 2019 19:10:15 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
 Tue, 7 May 2019 19:10:14 -0700
From: Wenlin Kang <wenlin.kang@windriver.com>
To: <jason.wessel@windriver.com>, <daniel.thompson@linaro.org>,
 <prarit@redhat.com>
Date: Wed, 8 May 2019 09:52:39 +0800
Message-ID: <1557280359-202637-1-git-send-email-wenlin.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: windriver.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hOC2J-009NZv-7C
X-Mailman-Approved-At: Wed, 08 May 2019 08:18:54 +0000
Subject: [Kgdb-bugreport] [PATCH] kdb: Fix bound check compiler warning
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The strncpy() function may leave the destination string buffer
unterminated, better use strlcpy() instead.

This fixes the following warning with gcc 8.2:

kernel/debug/kdb/kdb_io.c: In function 'kdb_getstr':
kernel/debug/kdb/kdb_io.c:449:3: warning: 'strncpy' specified bound 256 equals destination size [-Wstringop-truncation]
   strncpy(kdb_prompt_str, prompt, CMD_BUFLEN);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 kernel/debug/kdb/kdb_io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 6a4b414..7fd4513 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -446,7 +446,7 @@ static char *kdb_read(char *buffer, size_t bufsize)
 char *kdb_getstr(char *buffer, size_t bufsize, const char *prompt)
 {
 	if (prompt && kdb_prompt_str != prompt)
-		strncpy(kdb_prompt_str, prompt, CMD_BUFLEN);
+		strlcpy(kdb_prompt_str, prompt, CMD_BUFLEN);
 	kdb_printf(kdb_prompt_str);
 	kdb_nextline = 1;	/* Prompt and input resets line number */
 	return kdb_read(buffer, bufsize);
-- 
1.9.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
