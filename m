Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2774DDA488
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 17 Oct 2019 06:12:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iKx9K-0004Hy-U3
	for lists+kgdb-bugreport@lfdr.de; Thu, 17 Oct 2019 04:12:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iKx9J-0004Hr-UO
 for kgdb-bugreport@lists.sourceforge.net; Thu, 17 Oct 2019 04:12:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZzqdPppOqmZ7owdzuL7vxTFr6ZcenIPQ+cUypjsYJBg=; b=WKKczA8u/Bb/Xcil+RBqE5NU14
 DETCTp2q/hriICmPle3PdSaZA28a8jDTyuVO034Rd+j16Uubtg3MAMVIQfxkVO8oAkkt5V2dAOUwx
 CzjfrY0bTZEE08L9hErh0kAnFgBfhAMWQ9CeLtvT34uGsRQlnEMjmzcHDi0RdavwYwFk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZzqdPppOqmZ7owdzuL7vxTFr6ZcenIPQ+cUypjsYJBg=; b=kGP9F1pNEedSV8l4T9WiRp1n4T
 QXlewWI7H3wURm6xmsLef8IuCB1mnoxkhNCXkjOQSeiuQ9qFo9CrdTZFtwz66/GWU+xPRtWsHNXRX
 5+BzLlMds44JcVuOTBraJvqpQ8m8MOjSvLEHVSH1SMkWvbq3GkfLqJvajIyy6jvlF3bE=;
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iKx9I-004hvA-Kt
 for kgdb-bugreport@lists.sourceforge.net; Thu, 17 Oct 2019 04:12:29 +0000
Received: by mail-il1-f196.google.com with SMTP id f13so662076ils.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 16 Oct 2019 21:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZzqdPppOqmZ7owdzuL7vxTFr6ZcenIPQ+cUypjsYJBg=;
 b=mQJY8fRgC8QygXRlAZYcoI2JQfO1ULEBuFZmc9AaaFY4UbsAiXtCwXJWkXannTU4A4
 QEf2Cl+BksR6GFrFSg0S5gtOm4HnILag8HNYzIbJt2G4xq+9P8XNBIM/kd61j/PTUyl0
 ZJISlimdDfQScCTn+qIlhOG0KdMZhFQRKUXUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZzqdPppOqmZ7owdzuL7vxTFr6ZcenIPQ+cUypjsYJBg=;
 b=TeF3pYNNYZyfy4foTdgz4hsFX1W6gyq+UR9hudAS+ovKaD1HCrQASEKPaFhzOrE0L2
 TJ2I1Kq2AEbEhIcrr9fNL9a+bsXzgkX/mSThMY9K9itH8XbRXrULwEOrWcESLox6sF0m
 VJ7xocBs9HkaSC1iCAV1Z1nhEiSzJi0Vb3aDQKPYNpcKBvCYstnQUIHG/5LPYzTAYGa6
 gYlEPaJ4tOqvsLZqObcp3MsP9Xeyrj0IoSTkrND8bMi6y+AbRX6+AUNLKJ0kkn7FDlqE
 1KJjWujWMV8Ye0ReVxA4+PefWIMIYsFEnWV2C2+RgsIt/1Ehl/H4lSsy+TUjGnI7HWCB
 USFQ==
X-Gm-Message-State: APjAAAXiUkjkfOM+GwpP7myIJV12ORdOVOBIE0m8q8cFjmAhl5P4QEha
 QkPdyzKeZ6n/nlOiJkAmiob23BzbCd8=
X-Google-Smtp-Source: APXvYqzxqaQHhUd2kSLjAb+IDHVnbF67t2bsWI5b1OV9WRfLPPpe8xXrI1Y22XvMI9o95pXkTDapDQ==
X-Received: by 2002:a92:5f06:: with SMTP id t6mr1530881ilb.203.1571285542537; 
 Wed, 16 Oct 2019 21:12:22 -0700 (PDT)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com.
 [209.85.166.42])
 by smtp.gmail.com with ESMTPSA id o16sm367793ilf.80.2019.10.16.21.12.21
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2019 21:12:22 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id b19so1307126iob.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 16 Oct 2019 21:12:21 -0700 (PDT)
X-Received: by 2002:a6b:7715:: with SMTP id n21mr1090520iom.142.1571285541570; 
 Wed, 16 Oct 2019 21:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <20191014154626.351-1-daniel.thompson@linaro.org>
 <20191014154626.351-6-daniel.thompson@linaro.org>
In-Reply-To: <20191014154626.351-6-daniel.thompson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Oct 2019 21:12:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UYbC0zQHfW8XLfw0ipnjtccyh7EXPXsRnOA_MM-m3wbg@mail.gmail.com>
Message-ID: <CAD=FV=UYbC0zQHfW8XLfw0ipnjtccyh7EXPXsRnOA_MM-m3wbg@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.196 listed in list.dnswl.org]
 1.2 RCVD_IN_BL_SPAMCOP_NET RBL: Received via a relay in bl.spamcop.net
 [Blocked - see <https://www.spamcop.net/bl.shtml?209.85.166.196>]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iKx9I-004hvA-Kt
Subject: Re: [Kgdb-bugreport] [PATCH v3 5/5] kdb: Tweak escape handling for
 vi users
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
Cc: kgdb-bugreport@lists.sourceforge.net, Patch Tracking <patches@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Mon, Oct 14, 2019 at 8:46 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> Currently if sequences such as "\ehelp\r" are delivered to the console then
> the h gets eaten by the escape handling code. Since pressing escape
> becomes something of a nervous twitch for vi users (and that escape doesn't
> have much effect at a shell prompt) it is more helpful to emit the 'h' than
> the '\e'.
>
> We don't simply choose to emit the final character for all escape sequences
> since that will do odd things for unsupported escape sequences (in
> other words we retain the existing behaviour once we see '\e[').
>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  kernel/debug/kdb/kdb_io.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
