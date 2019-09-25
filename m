Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3405EBE675
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 25 Sep 2019 22:32:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iDDxr-0004Te-0O
	for lists+kgdb-bugreport@lfdr.de; Wed, 25 Sep 2019 20:32:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iDDxp-0004TQ-LS
 for kgdb-bugreport@lists.sourceforge.net; Wed, 25 Sep 2019 20:32:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xNhpGEC3xKEUzgeifEP+x7IybNdlV9Dtf/y1slQituc=; b=k0JqJwZp+XcUEY8MrQkmR6K6lF
 1lf3PMqi2v+4vBkBacf59WQeDVoOj3tVzjiS/y/MJ2b39iRZe5JeORqH/jngGhxUBT/OSsqamBX5R
 asiw9J+9L+ihbdhXEfgqtX/5YXrcrBbw8QrEGVuQ4WFAgdf+NDKaLbAZyyIRo7h8vMMc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xNhpGEC3xKEUzgeifEP+x7IybNdlV9Dtf/y1slQituc=; b=K
 6FGE3l0xcTyknWDkP1tscrxzq0qRvMbzziCV9ST++qZwKiG9Zn7DbkncnFFYicHg6K5WfQ4qwVR92
 yZ1pPvzGdgRVa+o6brgyj9uF0MfUWa7IiI9tT+pCe7odOtaDm0MfKk+l7//gb+nzm3+LwaIdHVXtu
 BJqx2v2nXIxzZH1Y=;
Received: from mail-pg1-f195.google.com ([209.85.215.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iDDxl-008vCC-4q
 for kgdb-bugreport@lists.sourceforge.net; Wed, 25 Sep 2019 20:32:41 +0000
Received: by mail-pg1-f195.google.com with SMTP id i14so378755pgt.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 25 Sep 2019 13:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xNhpGEC3xKEUzgeifEP+x7IybNdlV9Dtf/y1slQituc=;
 b=CQMQfbbhrVok3TQFG72mIe+jYOOE+rU3M4M2qRpg13+nMIm+qvgQKOuHfWtwoVlepb
 EIFUic7kp41e7CV0luGlbcFCcB4shxf6JyN4eHqo+bMywTwPOioxbIctP3uvZRp7ddKl
 aLHQnVcccOR30bs3QOuDXSDlaUJEJbT2NOVX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xNhpGEC3xKEUzgeifEP+x7IybNdlV9Dtf/y1slQituc=;
 b=JbPNVZhWQWSZYfYiT6RkjBHMbD9/9Tb1eC9lAR9n1HWy7hjsOZdCXx6oUDLTfl4vNO
 uassKWN4Hjc41Ur/XEWkUfsDA8vTTrCoQhnN9gzPIJ2hDKYP2jPQKSwupeUXnYmALCoY
 ll2JRUerz43rtT4LaNv7CjU0yw1hhAKSehF5dQV8ogIYlwZg20tqeU+vZoI7y3mBRZij
 yYuFC9bLuINgATs2T/ABSZSE8hDtRlTl4HQl0fyER90NWu1/RURI8MsYzqwZsXaqqh8F
 5P9hE7EBgJ8eMM8xWRH+ogiUr8fmrKF4wBU04cbWjjRQpd0Jtm1d2bBBU9yd70vkyZVd
 Ivew==
X-Gm-Message-State: APjAAAWk154XvMmcnJnMaec1MzwFWBfZ5/qfdmQlrUMBxrEh4/nUfhKf
 Xx2Pml6RAYAbEa0dv09yzpcO7DGmnsg=
X-Google-Smtp-Source: APXvYqzhC0Ga95TJdizkW4HlNLgb6ji6lavDbKM7n54/+dTbnR/WUEVhDadt2Le0ynCTkxMhsY56Vg==
X-Received: by 2002:a17:90a:2744:: with SMTP id
 o62mr8222552pje.139.1569441768922; 
 Wed, 25 Sep 2019 13:02:48 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id d76sm458113pga.80.2019.09.25.13.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 13:02:48 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>
Date: Wed, 25 Sep 2019 13:02:16 -0700
Message-Id: <20190925200220.157670-1-dianders@chromium.org>
X-Mailer: git-send-email 2.23.0.351.gc4317032e6-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.195 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iDDxl-008vCC-4q
Subject: [Kgdb-bugreport] [PATCH v3 0/4] kdb: Fixes for btc
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net


This series has a few kdb fixes for back tracing on CPUs.  The
previous version[1] had only one patch, but while making v3 I found a
few cleanups that made sense to break into other pieces.

As with all things kdb / kgdb, this patch set tries to inch us towards
a better state of the world but doesn't attempt to solve all known
problems.

Please enjoy.

[1] https://lore.kernel.org/r/20190731183732.178134-1-dianders@chromium.org

Changes in v3:
- Patch ("Remove unused DCPU_SSTEP definition") new for v3.
- Patch ("kdb: Remove unused "argcount" param from...") new for v3.
- Patch ("kdb: Fix "btc <cpu>" crash if the CPU...") new for v3.
- Use exception state instead of new dbg_slave_dumpstack_cpu var.
- Move horror to debug core, cleaning up control flow.
- Avoid need for timeout by only waiting for CPUs marked as slaves.

Changes in v2:
- Totally new approach; now arch agnostic.

Douglas Anderson (4):
  kgdb: Remove unused DCPU_SSTEP definition
  kdb: Remove unused "argcount" param from kdb_bt1(); make btaprompt
    bool
  kdb: Fix "btc <cpu>" crash if the CPU didn't round up
  kdb: Fix stack crawling on 'running' CPUs that aren't the master

 kernel/debug/debug_core.c | 34 ++++++++++++++
 kernel/debug/debug_core.h |  3 +-
 kernel/debug/kdb/kdb_bt.c | 94 +++++++++++++++++++--------------------
 3 files changed, 83 insertions(+), 48 deletions(-)

-- 
2.23.0.351.gc4317032e6-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
