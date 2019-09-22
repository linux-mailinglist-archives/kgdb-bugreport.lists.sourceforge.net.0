Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 26570BA29A
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 22 Sep 2019 14:27:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iC0xp-0005Ux-PO
	for lists+kgdb-bugreport@lfdr.de; Sun, 22 Sep 2019 12:27:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1iC0xn-0005Up-UH
 for kgdb-bugreport@lists.sourceforge.net; Sun, 22 Sep 2019 12:27:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UGdx2m0S9QvAjbLqOm0Zf2PfBlC/QtEdACG0CQOJwK0=; b=NgqU+gIXAamRrJ3M5ozSEYK28z
 L5GCHtBtjBlH3SM87gwKdCgB1A4Zp7s3WGs7DemNsMdNviRQz6NrjMMWli0E0HHX1x99xQ2g3Lzk8
 pETFT1j3Z2yxFkuGVuxceQW2M54AeL+kdD4jw/3q/PF70orqJRukBub7GHL8BEA4A+j8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UGdx2m0S9QvAjbLqOm0Zf2PfBlC/QtEdACG0CQOJwK0=; b=OzFKj6mjYs2mUhrjI1pw3++KVk
 HKBVzz/GVxZwTBK6Uy+VQRWvHFO3TPz8OJJ5vaUHEmZWJnoqeSDQyWWGIEMggrHZjOHnxO1cNPE+C
 7RIsIgJ9HNXpZf82ZRyeNbMtvqw8mJU8tIzq5dgkKZLYpzUwXMSZ5B2bSDl5yoDc8hNc=;
Received: from mail-pl1-f193.google.com ([209.85.214.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iC0xk-003bED-6a
 for kgdb-bugreport@lists.sourceforge.net; Sun, 22 Sep 2019 12:27:39 +0000
Received: by mail-pl1-f193.google.com with SMTP id t10so5204217plr.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 22 Sep 2019 05:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UGdx2m0S9QvAjbLqOm0Zf2PfBlC/QtEdACG0CQOJwK0=;
 b=R9tMKkjt52lMyoWS0mV74URoW/69+XRJR/oqc5JgX2RQMytKvyXgtNPVnrVJ6I6+l4
 XAvExaZNc0+zJt89nuw5Yap4zuazPHWq72DSxRz9uZpMW7QT9w7zcJkjWqDdgMEF46Rt
 1zSgWRJcTIKS2trbqaMO1b+znvxRvOqGiGFa2jqqY8VDHA2hiIjrUogG+o8DvG5QAOyq
 3X19xaHjkYdu0BeSENHWLLxdaQnZCZJEbEzEuylk0s4kI+HJTGw/vLjZvV/Ro6XGVKlP
 Nz+FixUaWcJDdxhmtXIYM0LAofjpRF8XUNjZ06lZ9NS5dIw9YFWwzAKT8PPqnsGJhpag
 URDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UGdx2m0S9QvAjbLqOm0Zf2PfBlC/QtEdACG0CQOJwK0=;
 b=sCApbkgT1GBNY3esi/0QfSdQ486NAJj+LQIbhlebbs9NjfRZLHL6+8rEd3CcJO/0oj
 /W8ZWxIoml+oWPeurYSK2fK7W8aYbUjirMJnvYXQtewdq3E/kR6EMzzSZ3njJg7DJkLS
 8V5+rJRuOnINWJlM60vIPX7kFiJWpTwJIkmX3RoI7JjexuSfDUZT/E6HKjEtDPW1Nm/v
 cbFhWutnoi5+/pRwuuBRkSNntL6txnp7K6ezNWZjzp1JoJM2k2s48Bzf4xt4BEwGRpl/
 LLyJpB1d+D0B9b6XC2QopWDkmhtz9f/pgDopgwX1skoIO9OVLNtsQQVtg+RLuLHXUG4e
 TReg==
X-Gm-Message-State: APjAAAWR5yHVnDdlgBXVpsehDnVy649D5VVrjcfB1rnthEzbKFfZitE/
 FJyLoD1T1LH3AD2cCqFs7jAOMg==
X-Google-Smtp-Source: APXvYqyBJW/4SsC7h3u3M+rDEMxUB3WaSWiImps5Ji3MU/V6D0jzqn0+POaMcZjYR3fXKq0Gb7I6ng==
X-Received: by 2002:a17:902:8c8d:: with SMTP id
 t13mr5502257plo.3.1569153481876; 
 Sun, 22 Sep 2019 04:58:01 -0700 (PDT)
Received: from holly.lan ([12.206.46.59])
 by smtp.gmail.com with ESMTPSA id 26sm9198858pjg.21.2019.09.22.04.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2019 04:58:01 -0700 (PDT)
Date: Sun, 22 Sep 2019 04:57:58 -0700
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20190922115758.jbouheoztxkndyvc@holly.lan>
References: <20190920104404.1.I237e68e8825e2d6ac26f8e847f521fe2fcc3705a@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190920104404.1.I237e68e8825e2d6ac26f8e847f521fe2fcc3705a@changeid>
User-Agent: NeoMutt/20180716
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.193 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.193 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1iC0xk-003bED-6a
Subject: Re: [Kgdb-bugreport] [PATCH] MAINTAINERS: kgdb: Add myself as a
 reviewer for kgdb/kdb
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, Rob Herring <robh@kernel.org>,
 "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
 kgdb-bugreport@lists.sourceforge.net, Linus Walleij <linus.walleij@linaro.org>,
 Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Will Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Sep 20, 2019 at 10:44:47AM -0700, Douglas Anderson wrote:
> I'm interested in kdb / kgdb and have sent various fixes over the
> years.  I'd like to get CCed on patches so I can be aware of them and
> also help review.
 
It will be great to have you on board. Actually I was already
contemplating informally pinging you to ask for review some of my clean
ups in the upcoming dev cycle. I'm very happy to make it official
instead!


> Signed-off-by: Douglas Anderson <dianders@chromium.org>

I'll get a PR together for this shortly (busy with travel this week).

In the mean time at least I can offer you a firm:
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
