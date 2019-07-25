Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA36474EDD
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 25 Jul 2019 15:11:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hqdWu-0006b3-Fm
	for lists+kgdb-bugreport@lfdr.de; Thu, 25 Jul 2019 13:11:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1hqdWs-0006ab-QM
 for kgdb-bugreport@lists.sourceforge.net; Thu, 25 Jul 2019 13:11:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ns9n/j7w0YQgCqC5KYUL/giziTifQV01XK0rryiopTA=; b=gi3jiAN1YbW9PbN28rrKNpwwR9
 L0k3zDkakJvirdeDjIQfGAVcfvKzB8ApNUsjYiPqa7DLeF3rFgXHYcIIrsKoDtte+HZwkdbQWQJFx
 f0q+AJRw/Q4OuUerzkGtkrPX/lvyic42UaUx2rW7b4VSLh8GdtebXm0fNhh6syxC43H8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ns9n/j7w0YQgCqC5KYUL/giziTifQV01XK0rryiopTA=; b=c1vc+jXM43zq5vbBg5221XPpif
 c6U73MWcpyB8Vu8TrjwpPRykj+awGVdj9CL+vLtym+rGHwE5UnyTebsSe9nb87hqgT/dasvGWS55a
 VpTrq4amoUgtp9KlI0x/oR5G5RHajTbaegSxSbY/DFTBwLJM2fRz2W/0nGzYHYssi1mk=;
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hqdWn-000joG-8L
 for kgdb-bugreport@lists.sourceforge.net; Thu, 25 Jul 2019 13:11:30 +0000
Received: by mail-wm1-f68.google.com with SMTP id v19so44733986wmj.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 25 Jul 2019 06:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ns9n/j7w0YQgCqC5KYUL/giziTifQV01XK0rryiopTA=;
 b=tGBYzgxf8R4FwqQvPOSk2mp/gjrJXsAbS+G8N7dmfjG5tqcvaB7OvQfCThb21tSWge
 RNLitm6isIDCk75IwrWAgJp/WHqLVlRPxy2L/+MWaT7zpPMMgfDoi0B9yq7u3HVukf+D
 Xz6ci9prmvCVdk7GxAl6WgyrPa7vMOiQwFpR++UTYdwK69x7/qYCV88G2FeOm5CbVkRa
 qC1JqVCtX2iKwfcTExPGnukRGs6BR0cXJ61W23OofeNOzXIRt1qlAM1cZCbn25zGRDIc
 jOLHktmulf0id7szHK9bejd9X75J0SxvrRQCW4LQhwHz3zBiLgJV+acZ9SMtu5CtoI+7
 +QXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ns9n/j7w0YQgCqC5KYUL/giziTifQV01XK0rryiopTA=;
 b=OoPFllkp724sNQ9WNRmL9bcWsgWKQV35/NItSj1vDMwFXwP0WAQ707JORXcOSjz+1Q
 XdgQNhWAgFGoV4iVkyQ22tgsbzrzt6Ju/yPgOEOA8osRH5TGy4gOhAmgUN1R+isGlq4z
 cYg4pPsW1lBjRIeQvhbffrvmsNvmUKt4VuuvbRXNmTyIdgJRqx/oh3xh0VNOrXm3o5jN
 YVTqUYJ9Wiu7nZACBjzaB/6kNv/W44r4nh6lULtsiQAHLT6PSfY94v8wxaKJaVzCPX1P
 hRaLB0TbIq6Mh0sqPfhQHXdIELQ6aUITKXfCqriFCnz4lVLxEluD8k9UpO/ey6Wt6l1J
 dvdQ==
X-Gm-Message-State: APjAAAWaga6D553enwR99iTRC7iIUhDQ612KvsMbOLwAcuclpfn8jqHB
 nmMmvgvyanerq4eJyEn+DbpMfQ==
X-Google-Smtp-Source: APXvYqwVx2H+xJ1kEsj1a5kPKAMRWC4FI6BY1zaemBDXu14L/K48Ow2TniPq3kloctgCjA2TZb9noA==
X-Received: by 2002:a05:600c:114f:: with SMTP id
 z15mr78952860wmz.131.1564060278516; 
 Thu, 25 Jul 2019 06:11:18 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id j9sm55743135wrn.81.2019.07.25.06.11.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 06:11:16 -0700 (PDT)
Date: Thu, 25 Jul 2019 14:11:14 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Wang Xiayang <xywang.sjtu@sjtu.edu.cn>
Message-ID: <20190725131114.buxcipgyr2d45bfi@holly.lan>
References: <20190725053345.5888-1-xywang.sjtu@sjtu.edu.cn>
 <20190725094401.zve4urozmdxtxulx@holly.lan>
 <919772995.4681005.1564056633580.JavaMail.zimbra@sjtu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <919772995.4681005.1564056633580.JavaMail.zimbra@sjtu.edu.cn>
User-Agent: NeoMutt/20180716
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.68 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hqdWn-000joG-8L
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: replace snprintf with strscpy
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
 jason wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Jul 25, 2019 at 08:10:33PM +0800, Wang Xiayang wrote:
> 
> ----- On Jul 25, 2019, at 5:44 PM, Daniel Thompson daniel.thompson@linaro.org wrote:
> 
> > On Thu, Jul 25, 2019 at 01:33:45PM +0800, Wang Xiayang wrote:
> >> As commit a86028f8e3ee ("staging: most: sound: replace snprintf
> >> with strscpy") suggested, using snprintf without a format
> >> specifier is potentially risky if the PROMPT environment
> >> variable contains any format specifier. The variable can be set
> >> via kdb_set() though by default it contains no format specifier.
> >> 
> >> Using strscpy is conservatively safe for any mistakenly
> >> environment variable setting that leads to crash.
> > 
> > This will result in a broken prompt on SMP machines. The default
> > prompt on an SMP machine includes the CPU number of the core that
> > is currently being debugged.
> > 
> > 
> 
> Well, this patch only changes the line compiled for UP so it does not
> break the prompt on SMP.

Understood, but fixing the issue exclusively for UP machines isn't
really worth it.


> Anyway, do you think the patch should be
> revised to actually sanitize the format string instead of
> conservatively ignoring them?

You mean adding a special case to kdb_set() to special case the setting
of PROMPT. Certainly possible although it might be simpler just to
forbid setting the prompt if KDB_ENABLE_MEM_READ isn't set.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
