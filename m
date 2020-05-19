Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F651D9912
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 19 May 2020 16:11:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jb2y1-0007PC-Qb
	for lists+kgdb-bugreport@lfdr.de; Tue, 19 May 2020 14:11:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <liwei391@huawei.com>) id 1jb2xz-0007P0-Fn
 for kgdb-bugreport@lists.sourceforge.net; Tue, 19 May 2020 14:11:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aFSR4hvLKUk9QGeYT8aBSJS9SBQSkMFJclKyFWePE8o=; b=GXPvJkrbMaHLOXlanedGF2rUtJ
 csk5i1rghwa2ODfH364YFqTMJAE3edSzxFoCg4FOidPVAtUNq7Be8mzJ3JhPGpV0uZ19FA+a2gV6o
 lszKslyerV59EdREdeyvFwnhCBWAuQZ+3JrLZz/sCghiplVFtBJeznpEwtndKQkiy8sc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aFSR4hvLKUk9QGeYT8aBSJS9SBQSkMFJclKyFWePE8o=; b=m8C64055j1uIWS7Xib5QqMAi6s
 ZCscNrLD0HVhi12bdd44M8rVuXHzZqbgtMsatJk7b/2SsK8eBY2lvx+mhANtk26NMMoGv+6ZdON+M
 6HkpCc5USbwtrFMgcxsD4o6FzFiAvtyWuNYx8vCpSIkJ832AKwQ9ou2VIgTETWT1sFTM=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jb2xv-007SaQ-Ek
 for kgdb-bugreport@lists.sourceforge.net; Tue, 19 May 2020 14:11:35 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id DA756E8C56956D7A7E34;
 Tue, 19 May 2020 22:11:17 +0800 (CST)
Received: from [10.166.215.145] (10.166.215.145) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Tue, 19 May 2020 22:11:12 +0800
To: Daniel Thompson <daniel.thompson@linaro.org>
References: <20200516092606.41576-1-liwei391@huawei.com>
 <20200519114008.lmdf44zmgcmnf27c@holly.lan>
From: "liwei (GF)" <liwei391@huawei.com>
Message-ID: <b7b0b881-08b8-2b7d-fc09-3d9d79b90cea@huawei.com>
Date: Tue, 19 May 2020 22:11:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200519114008.lmdf44zmgcmnf27c@holly.lan>
X-Originating-IP: [10.166.215.145]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jb2xv-007SaQ-Ek
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: Make the internal env
 'KDBFLAGS' undefinable
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
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Daniel,

On 2020/5/19 19:40, Daniel Thompson wrote:
> On Sat, May 16, 2020 at 05:26:06PM +0800, Wei Li wrote:
>> 'KDBFLAGS' is an internal variable of kdb, it is combined by 'KDBDEBUG'
>> and state flags. But the user can define an environment variable named
>> 'KDBFLAGS' too, so let's make it undefinable to avoid confusion.
>>
>> Signed-off-by: Wei Li <liwei391@huawei.com>
>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> I took a quick look at this and find myself thinking of KDBFLAGS as
> something of a misfeature.
> 
> I think I'd rather get kdb_env to show the value we wrote into
> KDBDEBUG.
> 
> Sure this means we cannot use KDBDEBUG to look at the least significant
> 16-bits but I think anyone who is debugging kdb itself should know
> enough to use `md4c1 kdb_flags` to read those anyway.
> 
> 

Agree. That will be more clear with no confusion. Currently,
KDBFLAGS will be shown only when KDBDEBUG is set, that is weird too.
So, let's just make it simple.
I can fix it as you suggested in the next post.

Thanks,
Wei


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
