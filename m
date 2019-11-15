Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CDDFD973
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 15 Nov 2019 10:39:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iVY50-0003y2-8P
	for lists+kgdb-bugreport@lfdr.de; Fri, 15 Nov 2019 09:39:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <paulburton89@gmail.com>) id 1iVPVO-0005u4-EH
 for kgdb-bugreport@lists.sourceforge.net; Fri, 15 Nov 2019 00:30:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bRROesaeb887xsfxVtqXv2u2WV15FLCC+kH5tjbZrG4=; b=KxqVdL96d24cS5awKQcVexZfYY
 HwlXhqN1lgt756ZHy1yEfkC4Wes7I2bvso7SfY5W2sKshLbk+26xBT6B/RA5rMUl5cRblxou0RyFh
 Ae2fTA+dBavPawIyI+Bono70Utr8ONvnbBtJaWG7QSXLtrRrU19xiZtuAGRJYSkMRfPA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bRROesaeb887xsfxVtqXv2u2WV15FLCC+kH5tjbZrG4=; b=mAMO7zaWhsNWrgCyXYCYjUWkQQ
 VImfmEzXSzcreCDY9ffFysf7X6XPAbZIWtjgUnVbOBCUR4tp1CQLp6mg7JbDcpzCV2tx5xd2Rh/Dy
 oal0yA6+bprvlK1uBgKifqBE9++v75ODAu2DKzjJcIDkWiGeMpTbEIbtion/vIaQy+IM=;
Received: from mail-pg1-f196.google.com ([209.85.215.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iVPVL-00H5Ja-4l
 for kgdb-bugreport@lists.sourceforge.net; Fri, 15 Nov 2019 00:30:30 +0000
Received: by mail-pg1-f196.google.com with SMTP id q17so4839227pgt.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 14 Nov 2019 16:30:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bRROesaeb887xsfxVtqXv2u2WV15FLCC+kH5tjbZrG4=;
 b=uRKmKDKbO3SnnR3iFU9YRCKxbhaOTCO78a2MDEnSdFukyie2Jz5hlPq2Vq/tjGBZjx
 hIZ4hH7MGAr04BqW/nD/uA01NapiORFFOTTE7i5LBXnu/Mqohi+oQpeU6DDBUDnoTUh8
 z1NxTnyhskhq35MmQG7XC/V2yja2AExBW1E4WbVfovh40IN5VTLPAPoM8jwp89Ews07d
 v4f0myG/Gmpw13aG2Bj+Q5NPmGzARenqbWI6MUs6nyEfrKr1IMx/kvfWpII4bO0FU1NP
 QFkwZf+11o/FZryAHg/ZHbDRCDVZwKuhj0LVlEfDPSNydcA4iN60xWHsx/5k9A1xVPnk
 G42A==
X-Gm-Message-State: APjAAAXC8ak13/Zctnl83M1dvhazwtnedtnAnBbv5fT0rh6ziFvtBfv6
 i4gw/uL+WWGE1OkWczUaYBjgdONhCXbmIQ==
X-Google-Smtp-Source: APXvYqxRCiDHNwOwz8S2vHv+Vw1KysxP6MjchfjJ8RJjB+G4iXLq5xzmRwKDSWDpgbgjjVU/9UyUpw==
X-Received: by 2002:a65:528b:: with SMTP id y11mr13072963pgp.420.1573777820863; 
 Thu, 14 Nov 2019 16:30:20 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
 by smtp.gmail.com with ESMTPSA id y24sm9046884pfr.116.2019.11.14.16.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2019 16:30:19 -0800 (PST)
Date: Thu, 14 Nov 2019 16:30:51 -0800
From: Paul Burton <paulburton@kernel.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <20191115003051.blbbwr7hmuqyzjwb@lantea.localdomain>
References: <20191109191644.191766-1-dianders@chromium.org>
 <20191109111623.1.I30a0cac4d9880040c8d41495bd9a567fe3e24989@changeid>
 <20191114105125.t3jma3ghwj2wtv6w@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191114105125.t3jma3ghwj2wtv6w@holly.lan>
User-Agent: NeoMutt/20180716
X-Spam-Score: 0.7 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (paulburton89[at]gmail.com)
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (paulburton89[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
X-Headers-End: 1iVPVL-00H5Ja-4l
X-Mailman-Approved-At: Fri, 15 Nov 2019 09:39:49 +0000
Subject: Re: [Kgdb-bugreport] [PATCH 1/5] MIPS: kdb: Remove old workaround
 for backtracing on other CPUs
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
Cc: qiaochong@loongson.cn, kgdb-bugreport@lists.sourceforge.net,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, ralf@linux-mips.org,
 Mike Rapoport <rppt@linux.ibm.com>, Paul Burton <paul.burton@mips.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Jason Wessel <jason.wessel@windriver.com>, James Hogan <jhogan@kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Daniel,

On Thu, Nov 14, 2019 at 10:51:25AM +0000, Daniel Thompson wrote:
> On Sat, Nov 09, 2019 at 11:16:40AM -0800, Douglas Anderson wrote:
> > As of commit 2277b492582d ("kdb: Fix stack crawling on 'running' CPUs
> > that aren't the master") we no longer need any special case for doing
> > stack dumps on CPUs that are not the kdb master.  Let's remove.
> > 
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > I have no way to test this personally, so hopefully someone who uses
> > kdb/kgdb on MIPS can.
> 
> I took this as a hint to add mips support to kgdbtest ;-)

Wonderful! :)

> Support is added and working well. Unfortunately lack of familiarity
> with mips means I have not yet figured out which mips defconfig gives
> us working SMP (and what the corresponding qemu invocation should be).

You can build 64r6el_defconfig & boot it something like this:

$ qemu-system-mips64el \
    -M boston -cpu I6500 -smp 4 \
    -kernel arch/mips/boot/vmlinux.gz.itb \
    -serial stdio \
    -hda my-disk-image.bin \
    -append "root=/dev/sda"

Linux should see the system as a single core with 4 hardware threads
(VPs or Virtual Processors in MIPS terminology).

> > Ideally this patch should be Acked by MIPS folks and then land through
> > the kdb/kgdb tree since the next patch in the series, ("kdb:
> > kdb_current_regs should be private") depends on it.
> 
> An Acked-by from a MIPS maintainer would be very welcome. Perhaps
> with a bit of extra work on the above I might be able to provide
> a Tested-by:.

The patches look reasonable to me; I was hoping to test them before
giving an ack but haven't had the time yet. It seems you may be making
that easier :)

Thanks,
    Paul


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
