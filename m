Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8408C203999
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Jun 2020 16:35:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jnNXY-00069Y-8l
	for lists+kgdb-bugreport@lfdr.de; Mon, 22 Jun 2020 14:35:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jnNXW-00069C-Dk
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Jun 2020 14:35:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3GI1uGL8qRj0UWsRg1f35/N6knURd5cco/VjWV8guxI=; b=Pv2PmoE0L3I7zsOZTCfTe3EG+0
 vRAqzP8giFri+p13rtoIKVei3d7pYlWoJmB23EW/LcIPOQc0gAAINfTvc5hauRo1S+5ZY1EozEkFZ
 35zbBaYyOUTujlgXYBIOz66KQotdId2s8Xgd18KrvTcZn8ita6qQm8Aq+O9ref3iTQ38=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3GI1uGL8qRj0UWsRg1f35/N6knURd5cco/VjWV8guxI=; b=D9gvuelqW8kNBkuMGl+iBRabLR
 O520oC9jt7g8foUMrp5jP1rFYie5KLnsJx79LXKzywGVGhRlnpislOtRAmCYgMFlzckqEuvUzhbV6
 IkmeadDrsbciuKpOZIZnb+bzJNaVVUuH8IlENyTo/hJPgx/x+KzgbbMtZWzQLInOkA2Q=;
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jnNXU-00E0y5-AS
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Jun 2020 14:35:14 +0000
Received: by mail-oi1-f194.google.com with SMTP id d67so15774163oig.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Jun 2020 07:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=3GI1uGL8qRj0UWsRg1f35/N6knURd5cco/VjWV8guxI=;
 b=CcQ+0S6+v97SJO9VqZ1l3zquEMKhBkbcW/mJDEWfKfhOwMPLFJd8tfH+lqmbqz5SEH
 wJe2AxmAsInK6RWKkFdunWoh0OZpYUei2rkv+4VsjH18jzdmSoWWbzfI+3TeuZ2ZcTZc
 DyDiyAcuwI0MJxW/DCAxav6ctw9GQsLe3aQLlmFsco10yy1oVcIx4uoPm4LQBQR08cYt
 jSe7oExrAEuFqb52wL+qT6kK4ZPX7LVJXEgB3s+gcBG7h5j7YuCyw5Fg5/chnvLQfeXB
 4tYZ8jGawHQD9UufmWlaYnikek7LGVN/3/uxEjH+L1Pl74VKof4oz54ibaDXG0nahoMO
 nwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3GI1uGL8qRj0UWsRg1f35/N6knURd5cco/VjWV8guxI=;
 b=CNNfwMEp4dHDAhplaF5PWyUf7vzDBNT8KHeWO6C/rAtxqc7G1vBAO6gJBrOeoyj2WQ
 +Az+NYJC6MvqygagSz0M2sqIwALUy1LspmOA13IUcSdtzfowp0jam08f2pYw/N91uyEX
 5fUNnud30iHzcVv1ZVMPJj4InKckvpwOeq31YEvgK5d0WFiiW7871x4xo1lsRfgdbS86
 9QD8hgSxm9t+wMzpcE2L01QcTo5+2NJfEas5AsdMtBf+yNewWDmELwqBkiopPu2OB2mB
 w0QFmN1DYOyb04EFI2AbCv83VAgO3csLIEX2UvV2BjGBUMZP+ZbnUZxeoox8RKkJMxUs
 TeQA==
X-Gm-Message-State: AOAM530gFRzsSb6pO2Y5xAttMadpkT67+HsDN9VykYu0e4g8k66OmYcx
 8sRH/Hs2PeFfMWWsXnUQox8A5wZMg3M=
X-Google-Smtp-Source: ABdhPJwIWQswOm3gAoyhRJ8B6sV7a9AiL57ArtJyCd3xKaqvSlNveqUuHLc4rb86sbspHNrCNoA0tw==
X-Received: by 2002:a17:90a:acf:: with SMTP id
 r15mr19289807pje.171.1592836039745; 
 Mon, 22 Jun 2020 07:27:19 -0700 (PDT)
Received: from localhost.localdomain ([117.252.67.186])
 by smtp.gmail.com with ESMTPSA id d6sm14547939pjh.5.2020.06.22.07.27.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jun 2020 07:27:18 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net,
	linux-serial@vger.kernel.org
Date: Mon, 22 Jun 2020 19:56:17 +0530
Message-Id: <1592835984-28613-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: 1.4 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 1.5 RCVD_IN_SORBS_WEB      RBL: SORBS: sender is an abusable web server
 [117.252.67.186 listed in dnsbl.sorbs.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.194 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.194 listed in list.dnswl.org]
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jnNXU-00E0y5-AS
Subject: [Kgdb-bugreport] [PATCH 0/7] Enable support for kgdb NMI console
 feature
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

This work is derived from Daniel's prior work here [1]. It has been
rebased (tag: kgdb-5.8-rc1 + console hardening patch-set[2]), reworked
to use serial RX interrupt as NMI (pseudo NMI on aarch64) in order to
drop into debugger and tested on Developerbox (using amba-pl011).

- Patch #1 is more of a fix required for NMI console to replace kgdb IO
  console.
- Patches #2 to #6 adds an architecture agnostic fallback mechanism to
  enable kgdb NMI console using serial RX interrupt as NMI.
- Patch #7 is an optimization patch that gets rid of inefficient timer
  based tasklet and rather uses irq_work.

Usage of kgdb NMI console:
- Enable "CONFIG_SERIAL_KGDB_NMI".
- Kernel cmdline modification for Developerbox:
   console=ttyNMI0 kgdboc=ttyAMA0

[1] https://git.linaro.org/people/daniel.thompson/linux.git/log/?h=kgdb/polled_request_irq
[2] https://lkml.org/lkml/2020/6/4/294

Daniel Thompson (5):
  tty: serial: Add poll_get_irq() to the polling interface
  kgdb: Add request_nmi() to the io ops table for kgdboc
  serial: kgdb_nmi: Add support for interrupt based fallback
  serial: 8250: Implement poll_get_irq() interface
  serial: kgdb_nmi: Replace hrtimer with irq_work ping

Sumit Garg (2):
  serial: kgdb_nmi: Allow NMI console to replace kgdb IO console
  serial: amba-pl011: Implement poll_get_irq() interface

 drivers/tty/serial/8250/8250_port.c |  16 ++++++
 drivers/tty/serial/amba-pl011.c     |  12 +++++
 drivers/tty/serial/kgdb_nmi.c       | 100 ++++++++++++++++++++++++------------
 drivers/tty/serial/kgdboc.c         |  35 +++++++++++++
 drivers/tty/serial/serial_core.c    |  18 +++++++
 include/linux/kgdb.h                |   7 +++
 include/linux/serial_core.h         |   1 +
 include/linux/tty_driver.h          |   1 +
 8 files changed, 158 insertions(+), 32 deletions(-)

-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
