Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE5E30F6EC
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  4 Feb 2021 16:57:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l7h08-0005IQ-Cd
	for lists+kgdb-bugreport@lfdr.de; Thu, 04 Feb 2021 15:57:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1l7h05-0005Ht-8R
 for kgdb-bugreport@lists.sourceforge.net; Thu, 04 Feb 2021 15:56:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ly7xf8TFh+llh9NACNqhD5htNQtraLXImu4H9QbnzgY=; b=khVvdUxQCa87jI/fPtsxieU1yX
 K9LD0q0BpNKN3SAghPFvQlsR86B+haX2wtDEY+cPbWkuJomk6BkSTBn7cPeVOTFsYG9O+7LFCkc+Q
 S/N2NSaUIvS0dTyHSHB/TOqrsndKhlJkaaR/d+DRKZhDkYjtbfoLIET+HOYxzQ0fGqPg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ly7xf8TFh+llh9NACNqhD5htNQtraLXImu4H9QbnzgY=; b=i2uHDOM7de93YqoUxdjkcY+0I6
 gKZyAkQzS1Si+Te6pUcI/N2jSa08uJB/5DiaUwPnlhWYL77ycJkbvU2PDasSWy+LhmFA8bRGJiubl
 i+9g3PF1EPjValE1pb8NDMwE+CDOfwoaTItHWgZE5jOBMkuslHDT9hHajtHtMXSHoWkg=;
Received: from mail-wm1-f53.google.com ([209.85.128.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1l7gzs-00046a-Uo
 for kgdb-bugreport@lists.sourceforge.net; Thu, 04 Feb 2021 15:56:57 +0000
Received: by mail-wm1-f53.google.com with SMTP id 190so3582697wmz.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 Feb 2021 07:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ly7xf8TFh+llh9NACNqhD5htNQtraLXImu4H9QbnzgY=;
 b=h3SnCz2c5AYiddvzj7eISFAmhxovkdx9bJtYJXIf4aUqwRik4cRClZ74xY+VP6udj1
 ojiwmEqV7FwFZa4MjLIU3z1M3VW9zuuA7CS/tpn0rf1062dDXk2iSsSXznrir7mfzyz7
 oTbPdf3lFNYdEl3AjY4A/din9WSh22GD9NqaZo64T7s2MROkThDOuJ5OiIOcLSkMrj2+
 zKnID5doDlYPOr6uhx48dBHresMroL8MOaL5G2Z03UObFdBYuDBD9YA1FXY5VX/g89No
 fLY4zaMXUo6HoWshPxcJHndy0aMbeWS+Mu9VUYjuLGSJnikIvJHw0ioznYbJBxB2NnRs
 C4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ly7xf8TFh+llh9NACNqhD5htNQtraLXImu4H9QbnzgY=;
 b=P6cY3uqBAQK1Sd4IrnSJsSyfo2MsDxs7kmlJdN+uNWdJQ30J50VGzTkB+khsQTJIKa
 b3001lU19F9Gl0+eYjSC5TcsiqfRgxiZN0wdIMZRwx0J6kwGOaUWpyoyMMyzGj96/L03
 +BDT5vY8w88wVfo6E8nh1Akr3l7AXbXiXq96/54NV0H6NuwUxvQbbZWd1VEhpvtOAt31
 JD70N3/LI/c9QH6XzO3CuJqhtnL81uRlNIm5J7sOHiT1umFNMOXnGlwmAhTayu88uHKo
 HQppk6Cjavtmi7XKzvDUtsWW6C5JdOOwOr6QiVnrcuCg6Pq/7n8qu98zupz410612OqH
 Ku6A==
X-Gm-Message-State: AOAM533ouIzQHZUq1A3T8qOwsJAc0/DhU7BAjbQeQVyLdXRRb5ZVp9co
 Y6PboJeyWABfsiK3AD3WGX+mcQ==
X-Google-Smtp-Source: ABdhPJwT9Hv/gJ3vYpfNnuCmyBPsmF4rxBfKUFOgGOoGMPhrZaggCXVIOs0HDxVijPgYG4Y09+DI9Q==
X-Received: by 2002:a7b:c304:: with SMTP id k4mr146207wmj.11.1612454198541;
 Thu, 04 Feb 2021 07:56:38 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id e11sm8734325wrt.35.2021.02.04.07.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 07:56:37 -0800 (PST)
Date: Thu, 4 Feb 2021 15:56:35 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Stephen Zhang <stephenzhangzsd@gmail.com>
Message-ID: <20210204155635.ibvnyzo7qqgysfhl@maple.lan>
References: <1612440429-6391-1-git-send-email-stephenzhangzsd@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1612440429-6391-1-git-send-email-stephenzhangzsd@gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.53 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.53 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l7gzs-00046a-Uo
Subject: Re: [Kgdb-bugreport] [PATCH v4] kdb: kdb_support: Fix debugging
 information problem
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
Cc: kgdb-bugreport@lists.sourceforge.net, gustavoars@kernel.org,
 linux-kernel@vger.kernel.org, jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Feb 04, 2021 at 08:07:09PM +0800, Stephen Zhang wrote:
> There are several common patterns.
> 
> 0:
>         kdb_printf("...",...);
> 
> which is the normal one.
> 
> 1:
>         kdb_printf("%s: "...,__func__,...)
> 
> We could improve '1' to this :
> 
>         #define kdb_func_printf(format, args...) \
>                    kdb_printf("%s: " format, __func__, ## args)
> 
> 2:
>         if(KDB_DEBUG(AR))
>                 kdb_printf("%s "...,__func__,...);
> 
> We could improve '2' to this :
>         #define kdb_dbg_printf(mask, format, args...) \
>                            do { \
>                                         if (KDB_DEBUG(mask)) \
>                                                 kdb_func_printf(format, ## args); \

This line is picked up by checkpatch as being overlong.

>                            } while (0)
> 
> In additon, we changed the format code of size_t to %zu.

Should be `addition`.



> Signed-off-by: Stephen Zhang <stephenzhangzsd@gmail.com>

It is arguable that there should be a Reviewed-by: from Doug here...
although given the big changes in v3 I don't think you were wrong
to drop it.

Nevertheless... given the implicit R-b ("when Daniel merges") in Doug's
comments on v3 I decided to reinstate it.

No action needed from you on this. I have fixed up all these issues
when I applied the patch. Thanks!


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
