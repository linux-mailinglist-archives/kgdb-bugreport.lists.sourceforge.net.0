Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DAC1D5F5C
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 16 May 2020 09:19:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jZr6x-00074v-AX
	for lists+kgdb-bugreport@lfdr.de; Sat, 16 May 2020 07:19:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <liwei391@huawei.com>) id 1jZr6p-00074d-2D
 for kgdb-bugreport@lists.sourceforge.net; Sat, 16 May 2020 07:19:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D/cZMIqFxI8R2JtHH3LfbnfSBa2l2XIWqygkVlheyGI=; b=IquINj8yyVcc74vt6+hjXbjTnW
 DqDVWodQqdwt71O1Ie9gFp3pXxB7xLnU0SlQZaFNy+g4DApA6kk/yQ1wulLqTa9F83Oiz6CkE68Qv
 iONuxbJug+DtjqX6qspXM+g53qcYLP3zcGNKdcaXGflzPQkM7TBzVK+SN/f3hyR93JcY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=D/cZMIqFxI8R2JtHH3LfbnfSBa2l2XIWqygkVlheyGI=; b=Nuheddb0MnB10hX1Gi7PmHSpzT
 QPZuNStEmX3TlptnXSwCYPPtuJuzoNDUGoHuOqwNMRSRkVvPMuzDfRh2I0+t2whjcW7112H1xHVCd
 jwol/PFJM3aUVhovc4KW3mk700JdC+WR5NnTE9YARtq1akjrRdVNkQm/cqSnaGrIvVCM=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jZr6l-00CqLR-4Z
 for kgdb-bugreport@lists.sourceforge.net; Sat, 16 May 2020 07:19:47 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id B580D942583F32C4960F;
 Sat, 16 May 2020 15:19:33 +0800 (CST)
Received: from [10.166.215.145] (10.166.215.145) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Sat, 16 May 2020 15:19:29 +0800
To: Doug Anderson <dianders@chromium.org>
References: <20200511021637.37029-1-liwei391@huawei.com>
 <CAD=FV=VNTkRW9LbNjY_0Ljj57m19gFUEHAuYKd-i6jpu_QpMgg@mail.gmail.com>
From: "liwei (GF)" <liwei391@huawei.com>
Message-ID: <1672625a-5f2b-33db-c516-42abb070a26e@huawei.com>
Date: Sat, 16 May 2020 15:19:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAD=FV=VNTkRW9LbNjY_0Ljj57m19gFUEHAuYKd-i6jpu_QpMgg@mail.gmail.com>
X-Originating-IP: [10.166.215.145]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jZr6l-00CqLR-4Z
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Make the internal env 'KDBFLAGS'
 undefinable
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Douglas,

On 2020/5/14 7:41, Doug Anderson wrote:

>> -       }
>> +       } else if (strcmp(argv[1], "KDBFLAGS") == 0)
>> +               return KDB_NOPERM;
> 
> One slight nit is that my personal preference is that if one half of
> an "if/else" needs braces then both halves should have braces.  I
Thanks for spotting it. Refer to Documentation/process/coding-style.rst, i
will fix it in the v2.

> don't know what Daniel and Jason's policies are, though.  In any case,
> not that I've ever used the KDBDEBUG functionality, but your change
> seems sane.  Without it if I set "KDBDEBUG" and "KDBFLAGS" and then
> type "env" I see the flags listed twice, but one is real and one is
> fake.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> -Doug
> 

Thanks,
Wei


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
