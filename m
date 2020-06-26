Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4205320BA01
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 26 Jun 2020 22:08:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1joueM-0005hF-2C
	for lists+kgdb-bugreport@lfdr.de; Fri, 26 Jun 2020 20:08:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1joueK-0005h8-Ig
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Jun 2020 20:08:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jMfv6nXK7pXE53b5JeZ3qPQRps5vJ9xWNq/0HbrUb9M=; b=FoKT+8yFyQjucVyEPTQKTX6Zkd
 2kmAs3Jg714PZxGOsP0PjmFBEWnhDh775nF1ouh/otwk9b9yGeBBhOlAs4YJogIPiDVK3agsShAbI
 RqMsYaFkWsZqIwzoTGoc1UrbB9obs8se+HmPnHmHGQD8nQQrKQTVa/9WDbT3W6kkOKkQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jMfv6nXK7pXE53b5JeZ3qPQRps5vJ9xWNq/0HbrUb9M=; b=D
 30/aYruRFn9l/+mAM4CaEx6OkfQWTt2v4MGbs4l3ZdgrYNojQ2bkCIzg4tJ+c11S2gMb0lZMo3Ch2
 Yy8OtkN4zUSgGKjUyuNqu2fqUJFQMMEa2r3uZ3+OPn3VIQkrqgKBBci7Qh/Wxh12Ndh1d5ZGITahw
 6A8GQLjdheY/+EHo=;
Received: from mail-pj1-f68.google.com ([209.85.216.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1joueI-002N1M-Kj
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Jun 2020 20:08:36 +0000
Received: by mail-pj1-f68.google.com with SMTP id i4so5381769pjd.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 26 Jun 2020 13:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jMfv6nXK7pXE53b5JeZ3qPQRps5vJ9xWNq/0HbrUb9M=;
 b=CpAQ2H2udiH/DxH5k73Cwyduuat0KyUq+kl5yrWwSS+KOoxPZNPRnHakCrwVR1vhac
 CHhTpCltkDD/MK0BXGP1SYX1RN4UC+TfOxvRPRr8hiwwywM2IES/1oVQOLsoVKwnWOxe
 4ADPvrVMND13a+SvvgHzG5PzLLCMqFhuYEw8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jMfv6nXK7pXE53b5JeZ3qPQRps5vJ9xWNq/0HbrUb9M=;
 b=mscjihliAkCJUnuxhRyugbfbvClUodxsXHMddAAqDwzpEoVsGoq29DLMF7Ot3lXuCC
 p4MK1lpprKuR6ew3V147Z2EjclpyIEx35U3zT+OUoZy99hJpiZjfkSYMxUPk/7N3gZyk
 NHcxL6xfM++O4Yj8M2Vc5UfeCoahseb/PGrakZTOKL1+gEQi9SeebUebGDkCVdS5vpvv
 NaKxLvCNVxXMAABZIFgQlnezbs9D0h5OOjrza/nSgT7WuhsYRdHosZuT0LL1iNJosG3U
 nb5Vhbljc3ixrxs4kx9UEbP0u+0Z2GeMxdBxYuq3t8NE66U7LdZG+YW0UMejrAa4VSQP
 h/zQ==
X-Gm-Message-State: AOAM533uC+JUlX4OxzHRl6oUpBLLjEs8eiUO5weC62PDPNvgq030v5hh
 p3n2Dxy8BxRnyWBD1WNPQjgdVITw1Sk=
X-Google-Smtp-Source: ABdhPJy0YFaPET/B2NW9FwEvbgP3S2PwJhLr8+QIYcuGBkXXiDvrFI5Qn5U0UZYtVfnYkKW4HBdMdA==
X-Received: by 2002:a17:902:469:: with SMTP id 96mr3899228ple.93.1593201655931; 
 Fri, 26 Jun 2020 13:00:55 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id p8sm23461610pgs.29.2020.06.26.13.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 13:00:55 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: gregkh@linuxfoundation.org
Date: Fri, 26 Jun 2020 13:00:31 -0700
Message-Id: <20200626200033.1528052-1-dianders@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.68 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1joueI-002N1M-Kj
Subject: [Kgdb-bugreport] [PATCH 0/2] serial: qcom_geni_serial: Use the
 FIFOs properly for console
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
Cc: daniel.thompson@linaro.org, linux-serial@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, Jiri Slaby <jslaby@suse.com>,
 evgreen@chromium.org, swboyd@chromium.org, akashast@codeaurora.org,
 Andy Gross <agross@kernel.org>, vivek.gautam@codeaurora.org,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

This series of two patches gets rid of some ugly hacks that were in
the qcom_geni_serial driver around dealing with a port that was used
for console output and dealing with a port that was being used for
kgdb.

While the character reading/writing code is now slightly more complex,
it's better to be consistently configuring the serial port the same
way and doing so avoids some corner cases where the old hacks weren't
always catching properly.

This change is slightly larger than it needs to be because I was
trying not to use global variables in the read/write functions.
Unfortunately the functions were sometimes called earlycon which
didn't have any "private_data" pointer set.  I've tried to do the
minimal change here to have some shared "private_data" that's always
present, but longer term it wouldn't hurt to see if we could unify
more.

Greg / Andy / Bjorn:

This series of patches is atop the current Qualcomm tree to avoid
conflicts.  Assuming it looks OK, presumably the best way for it to
land would be to get an Ack from Greg and then Bjorn or Andy could
land it.


Douglas Anderson (2):
  serial: qcom_geni_serial: Make kgdb work even if UART isn't console
  serial: qcom_geni_serial: Always use 4 bytes per TX FIFO word

 drivers/tty/serial/qcom_geni_serial.c | 129 ++++++++++++++++++--------
 1 file changed, 88 insertions(+), 41 deletions(-)

-- 
2.27.0.212.ge8ba1cc988-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
