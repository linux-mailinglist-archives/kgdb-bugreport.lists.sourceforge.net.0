Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AFB33EE65
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 17 Mar 2021 11:37:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lMTYV-0006ka-9g
	for lists+kgdb-bugreport@lfdr.de; Wed, 17 Mar 2021 10:37:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <unixbhaskar@gmail.com>) id 1lMSCc-0008VH-0L
 for kgdb-bugreport@lists.sourceforge.net; Wed, 17 Mar 2021 09:10:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DCO4SGpYTn48obrAClA1NxmQHtXTT1+p+wX7tLZUWso=; b=FD+/mFFjlXmtiLr33Eg+hTa28v
 nc/ksQlnwEjFAk6qIOi4lIh1hac6oEQmjGqdMTrMEHFif+DUJMb7cVxE6E3II/pmbLoGqjReyieaH
 9cHqZ5xt4bAj4aWZgZxsiZSo2gx+Hjmbl6ijqz7gmQbCj7ohUKBOICxLAhwcbC6YOHi0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DCO4SGpYTn48obrAClA1NxmQHtXTT1+p+wX7tLZUWso=; b=W
 hN/6+e+I9T130AZlsVd8miab6gK+LMB77cwGAaJV4XjaR9ILh69Uyu4DeJ69s69gAHUxL0engzLG+
 VbWA0rkT5Fo2Iqxxon2MH3sG0OYJYrfOAbBUhi8TaXDUKu7Pg3Seu8UPCS4CWntE6rN1uJcUMsgG8
 DAUj7CWBlE5zc3LA=;
Received: from mail-qt1-f171.google.com ([209.85.160.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lMSCV-0003C8-Bo
 for kgdb-bugreport@lists.sourceforge.net; Wed, 17 Mar 2021 09:10:53 +0000
Received: by mail-qt1-f171.google.com with SMTP id 73so832392qtg.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 17 Mar 2021 02:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DCO4SGpYTn48obrAClA1NxmQHtXTT1+p+wX7tLZUWso=;
 b=hheYuEzHbFUasFyKNJkgy946IunncImPTQG00VXga+Ouk8mNnufmqL5dk01c3VzmNo
 5wPhJ7Q/Q/jZtFzlpW9nvkGPXLf+obb0QCIKkDF+yBV05cT+cE14PnXI6VunS7WIZZ4X
 jKrCXgAFt0OUjy2GC18IDhSFanXuURGoIOPnpqUUWNcdwkQORuYoHGpTXkhRqrYb2TMn
 xgDoGyUIhF/AyrnNl98JlhhfzXZp+Rlc4DaXJL5tfAQqfEn2AhnrUlrZwUGxvon18mD4
 PknLy+AL2xvBCuezSIJQgdZLvKcvyNofTDs/IjsTY8ElyKaGtNXJ2uXNhnpok3bEQp1u
 K0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DCO4SGpYTn48obrAClA1NxmQHtXTT1+p+wX7tLZUWso=;
 b=moGu8YzOFMQVauNu0g9TakVmlUfzaKv1xersoD/sUNmcriw11XCyqbo7CymMEC1jEN
 x8yGx8V/hp+TXWDU+EvURYSXYMXuX1fvGOyodSId0V43+VofFObc28JnjNiNM4VO7m1s
 obxU4JO843pAh2P0+cYgJ4ykcaO9A9YOnWaeneOHdoh49UOo1UG3ApNjC3eXsX0TaEng
 6NXEknJOLXNAilEkMX0iG9MbDzja8yxF7fXdNCH8wUq0LAe+gZhFblKepTD9IjicWD9Z
 8QukDNuyDTKNpMWqaARzKZ9Y0RWA/ojxVM/A55QgPbnlmj5DHpdVz/7WEZjm2NfEzZyD
 2gHA==
X-Gm-Message-State: AOAM532/m/hpYhqx2u4jLHCz//Ohgv9fC8ccXl+/t+tCJbz00vKubhSi
 Lh1YM0Htb+N+J9segsz/DAg=
X-Google-Smtp-Source: ABdhPJyoORE5Q/k6SAwAzPgVJG6xpYOSlFLnqKSoDOiX1WlidPqqx1CTOLAXNGqvJOkUEIjpV2xhMg==
X-Received: by 2002:ac8:5047:: with SMTP id h7mr3107983qtm.22.1615972241644;
 Wed, 17 Mar 2021 02:10:41 -0700 (PDT)
Received: from localhost.localdomain ([37.19.198.48])
 by smtp.gmail.com with ESMTPSA id v137sm5092004qkb.109.2021.03.17.02.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 02:10:41 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 dianders@chromium.org, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Date: Wed, 17 Mar 2021 14:40:22 +0530
Message-Id: <20210317091022.347258-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Spam-Score: 3.5 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (unixbhaskar[at]gmail.com)
 3.6 RCVD_IN_SBL_CSS        RBL: Received via a relay in Spamhaus SBL-CSS
 [37.19.198.48 listed in zen.spamhaus.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.160.171 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.160.171 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lMSCV-0003C8-Bo
X-Mailman-Approved-At: Wed, 17 Mar 2021 10:37:34 +0000
Subject: [Kgdb-bugreport] [PATCH] kernel: debug: Ordinary typo fixes in the
 file gdbstub.c
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
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net


s/'O'utput/'Output/
s/overwitten/overwritten/
s/procesing/processing/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 kernel/debug/gdbstub.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/debug/gdbstub.c b/kernel/debug/gdbstub.c
index e149a0ac9e9e..5c96590725f1 100644
--- a/kernel/debug/gdbstub.c
+++ b/kernel/debug/gdbstub.c
@@ -204,7 +204,7 @@ void gdbstub_msg_write(const char *s, int len)
 	if (len == 0)
 		len = strlen(s);

-	/* 'O'utput */
+	/* 'Output */
 	gdbmsgbuf[0] = 'O';

 	/* Fill and send buffers... */
@@ -321,7 +321,7 @@ int kgdb_hex2long(char **ptr, unsigned long *long_val)
 /*
  * Copy the binary array pointed to by buf into mem.  Fix $, #, and
  * 0x7d escaped with 0x7d. Return -EFAULT on failure or 0 on success.
- * The input buf is overwitten with the result to write to mem.
+ * The input buf is overwritten with the result to write to mem.
  */
 static int kgdb_ebin2mem(char *buf, char *mem, int count)
 {
@@ -952,7 +952,7 @@ static int gdb_cmd_exception_pass(struct kgdb_state *ks)
 }

 /*
- * This function performs all gdbserial command procesing
+ * This function performs all gdbserial command processing
  */
 int gdb_serial_stub(struct kgdb_state *ks)
 {
--
2.30.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
