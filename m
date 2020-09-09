Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AF8262FA6
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  9 Sep 2020 16:18:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kG0vU-0000sb-Js
	for lists+kgdb-bugreport@lfdr.de; Wed, 09 Sep 2020 14:18:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1kG0vS-0000sT-Vc
 for kgdb-bugreport@lists.sourceforge.net; Wed, 09 Sep 2020 14:18:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z9k53vYT+N1BhX48Rij3GUI6/3bZme1pQPIscVRVPBk=; b=CWSfamXyNnC9gdIRebk2PkXPD9
 +3KLCRJTCnFQxQw6KAV9aV++RTY8nTI5M/aduuPvPqKNd/0vwYVTR/+DNcyf569aKSG2EfNMuEkrD
 JWnKnNZmIrYAgLML/4cA3lQjTI93B9Us8SXzZ2sDgyLpDYA3vp3HjeN61EZ/9mRHVMmE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=z9k53vYT+N1BhX48Rij3GUI6/3bZme1pQPIscVRVPBk=; b=b
 arzh/kmmP1M0WRuwKXIsmdAiJEjM6fGbvwq3a0DAJ/0IZdynGHhdrW63GurOHEJOzKGzdufFW5N1p
 0aso47YrqncXqH2ptc88Y2WD2JA8bSOOompY66r+vi+Wixl+9GDrWK/g9ICCgXmEN8zxwhnZSbYiq
 E4euRfKUzs6OgG70=;
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kG0vM-000ekj-J9
 for kgdb-bugreport@lists.sourceforge.net; Wed, 09 Sep 2020 14:18:18 +0000
Received: by mail-wr1-f67.google.com with SMTP id a17so3158979wrn.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 09 Sep 2020 07:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z9k53vYT+N1BhX48Rij3GUI6/3bZme1pQPIscVRVPBk=;
 b=w7pR2L08zpdeRf35Al+3qzs7BazoxXi4K4IFvtwZqlJyksSS0c7H3PF2KZ2sgSSDpP
 FujlD1ob/vsHrx5wxZLDonYVVHtcd+AXdHbZfNbNzsCZkbidsTZ+Lr4Nfn2Nd9M9vZBu
 6WI2b+ZvoxZ3zrP6nAIC6cjUK0kdYgTnytIoeXk4TNJlyjW7FMxZBxbkvHoOBZ82Zlrd
 kIL8pIbKnrXxflQBzM8bWpfk3tpF7rBN8mZm195zu+18tAAPCku7Da+vnsHdKAA/FT74
 EElHBXICQCjxCOv9+mZ/k2kk1GjvOPKLrcQ7X/wJpKqivHZx1iP9jiI/2aQIvbMhY/jx
 h32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z9k53vYT+N1BhX48Rij3GUI6/3bZme1pQPIscVRVPBk=;
 b=Q/X3XQN9n0IjOX2F43eeoRHfEttD42m0et1APx6hSihBPhxdfVPae6EzpzMZHzllYc
 rX87PfbLjuO5eszWtXtCDga8QQhfGung6D6ETNTQ35/JYor1UoN6PvtJFmI9LcHJ/zGQ
 +bPigtroGhEY0C2mphKJ9IgWpTwKbUiz1S//8LBuSCLLCXj8vKOI5EtlLF7Y0W4j+808
 a740qRF+iQiSSC71irIzmO2EJD+ybCXjXSiGOr8q9v3deIWEueBnEfa5CeNubPmdVhxW
 oG8zf+Yjfbh1sNkMJiCvxyRlKK9xzciED6TWXJz5FOTRG1d2/rwyOTnBmD6edAkGL3VO
 ZuuA==
X-Gm-Message-State: AOAM531gID3l0YwaZMx+KRgBBV8SVZkw838goJfZ3Slm3MqR2B5Z3zXq
 5BcrBHZJLjPe9RAC7LviH9qp8Kv6W8xTPp4X
X-Google-Smtp-Source: ABdhPJzTIAjuCKugtfkjMCZdT9znBSCY0+3Irznm89yqpZg1M9XHZgxPVJURAeXo03ClvT2+A4cCiw==
X-Received: by 2002:a5d:5042:: with SMTP id h2mr4138682wrt.409.1599661085905; 
 Wed, 09 Sep 2020 07:18:05 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id q18sm4463736wre.78.2020.09.09.07.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 07:18:05 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>
Date: Wed,  9 Sep 2020 15:17:08 +0100
Message-Id: <20200909141708.338273-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
X-Headers-End: 1kG0vM-000ekj-J9
Subject: [Kgdb-bugreport] [PATCH] kdb: Fix pager search for multi-line
 strings
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org,
 patches@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Currently using forward search doesn't handle multi-line strings correctly.
The search routine replaces line breaks with \0 during the search and, for
regular searches ("help | grep Common\n"), there is code after the line
has been discarded or printed to replace the break character.

However during a pager search ("help\n" followed by "/Common\n") when the
string is matched we will immediately return to normal output and the code
that should restore the \n becomes unreachable. Fix this by restoring the
replaced character when we disable the search mode and update the comment
acordingly.

Fixes: fb6daa7520f9d ("kdb: Provide forward search at more prompt")
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---

Notes:
    In the long term the kdb pager code would probably benefit from a
    bigger rewrite since the way it handles newlines is still quirky
    and confusing. However this fix is easy to backport so I decided
    not to hold it back whilst we wait for code that is not yet
    written.

 kernel/debug/kdb/kdb_io.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 9d847ab851db..e240c97086e2 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -706,12 +706,16 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
 			size_avail = sizeof(kdb_buffer) - len;
 			goto kdb_print_out;
 		}
-		if (kdb_grepping_flag >= KDB_GREPPING_FLAG_SEARCH)
+		if (kdb_grepping_flag >= KDB_GREPPING_FLAG_SEARCH) {
 			/*
 			 * This was a interactive search (using '/' at more
-			 * prompt) and it has completed. Clear the flag.
+			 * prompt) and it has completed. Replace the \0 with
+			 * its original value to ensure multi-line strings
+			 * are handled properly, and return to normal mode.
 			 */
+			*cphold = replaced_byte;
 			kdb_grepping_flag = 0;
+		}
 		/*
 		 * at this point the string is a full line and
 		 * should be printed, up to the null.

base-commit: f75aef392f869018f78cfedf3c320a6b3fcfda6b
--
2.25.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
