Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C48A90C09E
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 18 Jun 2024 02:42:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sJMvd-0007NR-53
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 18 Jun 2024 00:42:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1sJMvc-0007NG-Az
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 00:42:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EAmTQGDwnRoUTYe26zjjCbDBySNjpTqbxdCkAqrJzA4=; b=NV+bM770J/q1AjAitsYN0x1Zx0
 hMt5ZpQBdo2jgmKmv9Vi4ZFsVxe4Q5v90HSZgOHm5Pn0VLzntuGLxV9MqmligD9YKlCcylPzRB2i7
 1bgDUIXjXyj2k65kQzr2uyS7OdqXwJsnUoyBKQREhfPnkGd3U+i3+ABHzBGlFo0y4UxI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EAmTQGDwnRoUTYe26zjjCbDBySNjpTqbxdCkAqrJzA4=; b=D
 nZ//ZCDIXhCFjZ42fDfHM6RsDMIPQE+FC10/0F8Or5zu6qNGIEDI+af0vecZUo5sQv+YAd/q5o0/1
 DmLt34Kg+00+kofIsOlVyPYrt1g7DWGpQXy8LI5Wz16q+5M6IzsvJs3Mo1ODA6cGKI12NVtUWxVfE
 6+zor48DwFSipT4Q=;
Received: from mail-oi1-f170.google.com ([209.85.167.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sJMvc-00051m-GO for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 00:42:28 +0000
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-3c9c36db8eeso2688778b6e.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 17 Jun 2024 17:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718671342; x=1719276142;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EAmTQGDwnRoUTYe26zjjCbDBySNjpTqbxdCkAqrJzA4=;
 b=dM5lnJVq/Fesdn3bB2dNlW+s5bmildOqKJIbWC8p88T7c758SLPJIMOqzEKHXOwi0A
 R4sAt4Df8FAUIWCCG+G6fY5mBPy+OmliOv2qDoiuUwTCbr/tYMJOqXQWOq2CTZj8b0rB
 GKkxexLHzmvoMK9ifg5FI4ToaT/IXMIJwGD2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718671342; x=1719276142;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EAmTQGDwnRoUTYe26zjjCbDBySNjpTqbxdCkAqrJzA4=;
 b=er7jFaBQHQsMaFTNWm8qMyNGAvDYzA5LgHDW2vJISt/d8/SH3oH2BRJdo068ku/Pkv
 f2cG+/1Az6BkkuqLjaMXbClk3MiHYVLJUs3Zlz+XnvgfJxHC5zAh1l0jVz1+mKtMKHNA
 SW1f5Q1ZBgZDmo1h3+GEWLlMdfTbcxiWmm3sgd2Xd1cwc7cmkqvpzn0uvMFWXOu5oiuV
 Gu9UtmrhXrcNb42HipAPlTboLDD/9U6nAwgxTIMGU44cfK0Cshx1BVL4oeL7tTubEGIc
 1HdFqSV0HZnyvXE/bZQnZuZykTsYgjnZXux/bhurSh7gtF30JLxxM/mbdc16OPBy+SXw
 wmrg==
X-Gm-Message-State: AOJu0YxAZtVRZdyI4O9VT3LNHgU8oIC88jIi7zTu6taBxHMw0kWfSkFJ
 f6tW4TrAa7xVptHfK7oSPXfZOORwSDawtG/Q7eyFlVRt76e4RRBv3WtXDNTHiP8YOcmk4+OmLnA
 =
X-Google-Smtp-Source: AGHT+IHMNUwf5V0/59skzGTiBwg0s5Cu2tXWTY9d3on5TY7byFeiOmGlppfKSTCNe4S1l2n9pqUGHw==
X-Received: by 2002:a05:6a21:7884:b0:1af:86da:3f7 with SMTP id
 adf61e73a8af0-1bae7e224c7mr11021501637.4.1718670965170; 
 Mon, 17 Jun 2024 17:36:05 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:1798:e71b:11ad:8b94])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705ccb99f4dsm7905917b3a.216.2024.06.17.17.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 17:36:04 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Date: Mon, 17 Jun 2024 17:34:34 -0700
Message-ID: <20240618003546.4144638-1-dianders@chromium.org>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The overall goal of this patch series is to add the ability
 to read from IO mapped memory at the kdb prompt. This is something I've long
 wished to have but never got around to implementing until now. 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [209.85.167.170 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.167.170 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.167.170 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.170 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sJMvc-00051m-GO
Subject: [Kgdb-bugreport] [PATCH 00/13] kdb: Add the ability to read
 iomapped memory via kdb + clean up "md" commands
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
 Thorsten Blum <thorsten.blum@toblux.com>, linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jason Wessel <jason.wessel@windriver.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net


The overall goal of this patch series is to add the ability to read
from IO mapped memory at the kdb prompt. This is something I've long
wished to have but never got around to implementing until now.

As I tried to implement this, I realized that the existing "md" code was
a bit of a mess. I spent a bunch of time cleaning up the function which
made the ability to support iomapped memory atop that pretty simple.

The cleanup code here is not quite a no-op. The "md" handling code has
some esoteric corner cases that it handled and, as part of this, I removed
some of the weird corners. I have a hard time believing anyone was relying
on these, but if you think someone is then please yell.

Also note that it would probably be good to add iomapped memory writes,
but this series is already pretty long so maybe that can be done later.


Douglas Anderson (13):
  kdb: Get rid of "minlen" for the "md" command
  kdb: Document the various "md" commands better
  kdb: Use "bool" in "md" implementation where appropriate
  kdb: Drop "offset" and "name" args to kdbgetaddrarg()
  kdb: Separate out "mdr" handling
  kdb: Remove "mdW" and "mdWcN" handling of "W" == 0
  kdb: Tweak "repeat" handling code for "mdW" and "mdWcN"
  kdb: In kdb_md() make `repeat` and `mdcount` calculations more obvious
  kdb: Use 'unsigned int' in kdb_md() where appropriate
  kdb: Replease simple_strtoul() with kstrtouint() in kdb_md()
  kdb: Abstract out parsing for mdWcN
  kdb: Add mdpW / mdpWcN commands
  kdb: Add mdi, mdiW / mdiWcN commands to show iomapped memory

 kernel/debug/kdb/kdb_bp.c      |   5 +-
 kernel/debug/kdb/kdb_bt.c      |   4 +-
 kernel/debug/kdb/kdb_main.c    | 309 +++++++++++++++++++--------------
 kernel/debug/kdb/kdb_private.h |   5 +-
 kernel/debug/kdb/kdb_support.c |  48 +++++
 5 files changed, 236 insertions(+), 135 deletions(-)

-- 
2.45.2.627.g7a2c4fd464-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
