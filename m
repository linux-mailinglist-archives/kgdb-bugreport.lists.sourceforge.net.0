Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05022B970F
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 20 Sep 2019 20:15:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iBNRD-0004dA-Gt
	for lists+kgdb-bugreport@lfdr.de; Fri, 20 Sep 2019 18:15:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iBNRC-0004cX-LL
 for kgdb-bugreport@lists.sourceforge.net; Fri, 20 Sep 2019 18:15:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mMjUKUF3cIfdwdDd6wOmWCRURy4vMFjlEXHfVSbHKE0=; b=FPEkNCqKdGta/hQUSsg9ELHYGT
 jNhwFuGj/e006G9V04M+4ZmdvrQsWidPu71q0uaYe07RngxXrjgsJpqUhI6m+18RDh3Xtru8JLPrH
 VBIgPaau4C6UtFT5OoL0X8Lf2OGsMrfoyqp/r5I+508NWYu8fbOtS/sHPPTPNcE83psA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mMjUKUF3cIfdwdDd6wOmWCRURy4vMFjlEXHfVSbHKE0=; b=I
 SdenoQAYrH8UeapHcy8cxgwmdCQ9EKQjSN4mO6VQAw+xs3JeeoKs/cLvGZg5G2TTnDnQXrfeWVU52
 De9fckkkSEqsZeh61srItHDr1sLn5UZZvaRRV9vL8qXRtgHzwMeKqaV1gn/YSyS1+qNJTF7ZzNc4z
 c3HSd555f33JJNRc=;
Received: from mail-pf1-f194.google.com ([209.85.210.194])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iBNRA-000rlC-Ud
 for kgdb-bugreport@lists.sourceforge.net; Fri, 20 Sep 2019 18:15:22 +0000
Received: by mail-pf1-f194.google.com with SMTP id x127so5025182pfb.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 20 Sep 2019 11:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mMjUKUF3cIfdwdDd6wOmWCRURy4vMFjlEXHfVSbHKE0=;
 b=UTCz5T9pTipG2ai3Jg0Q2nLrumMBsZhbBYDBqQeWIwPKw467MxwPADbkU5ZxAPXYak
 gGE21KA0GUnOPMfpGHJpRyhexqtvhqj0uJOLTqERkxIRPfJMYpNTm/TmON/hiroMJHZK
 ApBSGFBG7cqHEJ3fNcDkvNO9VtiV+V0XGfwSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mMjUKUF3cIfdwdDd6wOmWCRURy4vMFjlEXHfVSbHKE0=;
 b=VgGT0zgdofB7BOy4UY5beGo6JLXKucw0k15ikRtu6miGlqGxTmRsJZ7aah8F7LiPU4
 ZWp3ROoNGQ1lcExaQVjSQdtHOE+WWtARXU5guhkXiDF83FrqUBLueorAMIfsbNKfJ3Dt
 1xiLN5lmlJ2EsJ0RHETLHYJOs9Ob2XGH6DNuHqMxPL4IPfURUIMphTq/cdmfNOqDeQlD
 +zwONt4keabzh58+nkzkAMI/7TKt2ayFMoDZU6/UOveHbEwFhBJ9ShAWcTsBAAMk4mAX
 Xn+GTgT4EedaUN/y9IGIxlBoNcXJ6OwpWjwdrkl35iiYjpAEoAfgxkdmeq3K+13qEoCS
 K7wA==
X-Gm-Message-State: APjAAAUXbjVflIsS76Ay6VT1I/7211whTj0RldHInGe92JHbKH0+Yfzn
 1oxJTUdLjwHDBm7O3vp/BYbK9Gk9+Ro=
X-Google-Smtp-Source: APXvYqw7hLLTq624hJAfLh5Bf90XWkrLIfcdhQSjveXlcb9vAIQZKYDDx0Gne0UGshnbMBfiEZFPRg==
X-Received: by 2002:a17:90a:d0c4:: with SMTP id
 y4mr6213248pjw.116.1569001531394; 
 Fri, 20 Sep 2019 10:45:31 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id p189sm2492672pga.2.2019.09.20.10.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2019 10:45:30 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>
Date: Fri, 20 Sep 2019 10:44:47 -0700
Message-Id: <20190920104404.1.I237e68e8825e2d6ac26f8e847f521fe2fcc3705a@changeid>
X-Mailer: git-send-email 2.23.0.351.gc4317032e6-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: windriver.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.194 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iBNRA-000rlC-Ud
Subject: [Kgdb-bugreport] [PATCH] MAINTAINERS: kgdb: Add myself as a
 reviewer for kgdb/kdb
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, Rob Herring <robh@kernel.org>,
 "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
 kgdb-bugreport@lists.sourceforge.net, Linus Walleij <linus.walleij@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Greg KH <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Will Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

I'm interested in kdb / kgdb and have sent various fixes over the
years.  I'd like to get CCed on patches so I can be aware of them and
also help review.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c740cf3f93ef..d243c70fc8ce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9052,6 +9052,7 @@ F:	security/keys/
 KGDB / KDB /debug_core
 M:	Jason Wessel <jason.wessel@windriver.com>
 M:	Daniel Thompson <daniel.thompson@linaro.org>
+R:	Douglas Anderson <dianders@chromium.org>
 W:	http://kgdb.wiki.kernel.org/
 L:	kgdb-bugreport@lists.sourceforge.net
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jwessel/kgdb.git
-- 
2.23.0.351.gc4317032e6-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
