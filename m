Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB0E21B4D6
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 10 Jul 2020 14:16:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jtrwk-00070r-Ul
	for lists+kgdb-bugreport@lfdr.de; Fri, 10 Jul 2020 12:16:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <cengiz@kernel.wtf>) id 1jtrwk-00070k-Eo
 for kgdb-bugreport@lists.sourceforge.net; Fri, 10 Jul 2020 12:16:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:References:In-Reply-To:Subject:Cc:To:
 From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gOX4sphzrKtF8mepX7kQpuOk+ZLHpH6cxwf9ToaOwYM=; b=G28BB5aUDULBFhbJfcZjPFR8Xb
 YAvZP0AdSSIALHihgHbKWzo3qQuSw7sVK6WqBwUysXGtcENxm91JRSbJjeOhgvDaIxy86BXMtv6zq
 luJfj2tmEw0XdSCffQBuWDUOIAT/W+JoKvMd07i/ybtHc7sucaVfcbhbvatwXtdEXNbw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gOX4sphzrKtF8mepX7kQpuOk+ZLHpH6cxwf9ToaOwYM=; b=jyhB28K/NChbNpPnU+SQPW6els
 OMbl+6rrerOdBnCqq3CNLJMp66v8Q94Ja1WmolJIlfJ05oel8oLUGBwXXCKKr0MyKaDFsJJHrgzrk
 ZI1XyMMZwzuVnKHAxL0Eunf17URBR5KKwsmo1zt10oKSJXt28hmQlulHdQknqkieC/Ds=;
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jtrwh-001yz1-Fm
 for kgdb-bugreport@lists.sourceforge.net; Fri, 10 Jul 2020 12:16:06 +0000
Received: from webmail.gandi.net (webmail23.sd4.0x35.net [10.200.201.23])
 (Authenticated sender: cengiz@kernel.wtf)
 by relay11.mail.gandi.net (Postfix) with ESMTPA id D807C10000D;
 Fri, 10 Jul 2020 12:15:55 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 10 Jul 2020 15:15:55 +0300
From: Cengiz Can <cengiz@kernel.wtf>
To: Daniel Thompson <daniel.thompson@linaro.org>
In-Reply-To: <CAD=FV=XbMfwAQ+M7oMksd0dv9xjkQrGhU8hVNahn7+vxTuhT6A@mail.gmail.com>
References: <CAFA6WYNpCG2xPERd=NeKf+EthbX+1R4iieOL52kWnBp8y_+Nbw@mail.gmail.com>
 <20200630082922.28672-1-cengiz@kernel.wtf>
 <CAD=FV=XbMfwAQ+M7oMksd0dv9xjkQrGhU8hVNahn7+vxTuhT6A@mail.gmail.com>
Message-ID: <4b91d92eda95cf4f1e153544ff4c17e1@kernel.wtf>
X-Sender: cengiz@kernel.wtf
User-Agent: Roundcube Webmail/1.3.13
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [217.70.178.231 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1jtrwh-001yz1-Fm
Subject: Re: [Kgdb-bugreport] [PATCH v3] kdb: remove unnecessary null check
 of dbg_io_ops
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
Cc: kgdb-bugreport@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hello Daniel,

On 2020-07-01 01:32, Doug Anderson wrote:
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: Douglas Anderson <dianders@chromium.org>

Wanted to ask about the status of this proposed patch.

I have checked your tree in git.kernel.org but you might be
collecting them somewhere else perhaps.

Thank you for your time

-- 
Cengiz Can
@cengiz_io


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
