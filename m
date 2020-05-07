Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C5D1C93F8
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  7 May 2020 17:11:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jWiB5-0001jJ-HE
	for lists+kgdb-bugreport@lfdr.de; Thu, 07 May 2020 15:11:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jWiB4-0001j1-TV
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 15:11:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RndLXpjGcg2BFmdbethLGIwu7OqaNE0mD4rRGU8RVzc=; b=IcmAf7bYU23CRM3n4QD8+qbXkN
 O/wbE2D4fWrb/TJNkKqCyVCzySS1T1SK9NifeMHQ8e+114jK822idlXfINFeaIpC+INomF/kaWEOB
 NgLo85ZxQcnDLcGK+4q2sBbe9uXDBdlNbF3Bvu/OpehQR5eNzOyEfc9hFLKsilT/KZ7Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RndLXpjGcg2BFmdbethLGIwu7OqaNE0mD4rRGU8RVzc=; b=FPLf2rvU3nPFMPxswmc22Oe8Zw
 eZhc2Pl0xoPRtkHjT0zsHmquW6GEMUUXIBerNJMeEmL9I+wGGKVdYgRniWMsk2FQvZ1VxkUL/Jiqc
 R3EJ8YIWA+adF+yXoAnqG5os3BE2jcn2fgMi465lgkmGb/ULutp2k2B8agBRgosINpXE=;
Received: from mail-ua1-f68.google.com ([209.85.222.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jWiB1-000Lto-JP
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 15:11:10 +0000
Received: by mail-ua1-f68.google.com with SMTP id 47so1959720uaj.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 07 May 2020 08:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RndLXpjGcg2BFmdbethLGIwu7OqaNE0mD4rRGU8RVzc=;
 b=nkAMZOGNPKlk7/n/u8CYJjF3Syua63LITwI5bpol7Mqr6TTXkvZw6dqszUIx/ap1/B
 2dZmgFSOZ9u78AywiwqogbB9v4eKI4IMaebLSxRBporBGtdbS4hwzV2kX5nAjoCwY71n
 B0oR0yhSAs/RGthRqb1FqMAneLaVwGi1i4tdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RndLXpjGcg2BFmdbethLGIwu7OqaNE0mD4rRGU8RVzc=;
 b=XErHmDZC3S1Oczosc5gzoRzcIuw3wsDLezWtGeKdUYKD9HfYD3DnAFxGo5lzFaRhsR
 gSeDbI9zO3vU9a7nmtTDZcio9g8VBWT/edjU8sB/LHbKlu5L8+6789nMQ/kOPmqXZNXT
 sXBCC0ipxtTMnwUC97kTqJt+Xt3fEWpwDA4qsoW/5lQfKvZrbq1P4/sssUSWT3DDHprz
 J6RATc8lcGksdKcZN+4Z981qiiuO95BftaKkXVJZqFoiT4NRIOmKLyWIXXFZswk74Pfk
 UWRnD5X+6Sv4RlCJE5lb+6OoF557DsrNJd/4ydgd7oz5+sqEgheHhLWQFSixanREHHtM
 tW3A==
X-Gm-Message-State: AGi0PuZw3FRQ7nIdDJFFKaNypQbiTwgLwOt0nUygBBZRLMTYt/NB28Ui
 MAqmTarP+yE6nEgjE9pKSpVuYAlSX1Q=
X-Google-Smtp-Source: APiQypKhGpX+xWexQuH12VHe996kSCeBFh/PmOXTohiL7CcmHaADpWeD2Nn196VkD8PGJpFlwSLWJQ==
X-Received: by 2002:a9f:25b8:: with SMTP id 53mr6531520uaf.102.1588864261177; 
 Thu, 07 May 2020 08:11:01 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com.
 [209.85.221.176])
 by smtp.gmail.com with ESMTPSA id s3sm3293674uao.0.2020.05.07.08.11.00
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2020 08:11:00 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id g129so1578957vkh.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 07 May 2020 08:11:00 -0700 (PDT)
X-Received: by 2002:a1f:c643:: with SMTP id w64mr12224571vkf.0.1588864259688; 
 Thu, 07 May 2020 08:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200507110649.37426-1-yanaijie@huawei.com>
In-Reply-To: <20200507110649.37426-1-yanaijie@huawei.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 7 May 2020 08:10:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wp-L_oYsb1N4O6VC-NN5Ht2+J8S5o7AJgOk==quhHstA@mail.gmail.com>
Message-ID: <CAD=FV=Wp-L_oYsb1N4O6VC-NN5Ht2+J8S5o7AJgOk==quhHstA@mail.gmail.com>
To: Jason Yan <yanaijie@huawei.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWiB1-000Lto-JP
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: Return true in
 kgdb_nmi_poll_knock()
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Thu, May 7, 2020 at 4:07 AM Jason Yan <yanaijie@huawei.com> wrote:
>
> Fix the following coccicheck warning:
>
> include/linux/kgdb.h:301:54-55: WARNING: return of 0/1 in function
> 'kgdb_nmi_poll_knock' with return type bool
>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> ---
>  include/linux/kgdb.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
