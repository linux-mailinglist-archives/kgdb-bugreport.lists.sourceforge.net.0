Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE79C6B831F
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 13 Mar 2023 21:53:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pbpAi-0001BW-3j
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 13 Mar 2023 20:53:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1pbpAg-0001BL-4V
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 13 Mar 2023 20:53:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cXlzN006xu3ZBfFq7erm402Or2NyISMhbX+wHGYXkEM=; b=KJ+jg0IRG4sJ98EsEWslFk8xGq
 phSz2mVi3JmfbgSHk7BiCUsv/jG5CRmwQOP/J3FV+j4AAVpTrozO78t7PXJe3eX73ZPvcwbnnjP4l
 Wwx7BrTzVfipwp4eaymrDEmFgn9IW4jCZcfLxV5X4LzjVjQ3CT+Q6nRJzyU/TX5DKDAU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cXlzN006xu3ZBfFq7erm402Or2NyISMhbX+wHGYXkEM=; b=MAl5aMKBJMWJ7aWZADKL/zvkx4
 VgALa/pU5vAFA9vGi/Q6nC+DvvE/oqixUjfLoQbqvb2nZ0e+oKNW4O4OUuEpzayMSYQFC6StHw5QV
 7oVixRICofqT8p2E2Wz6XpHvCM+ORCcDao97izlw7z+n/JqCbZXLUSKGzqdbUkYI/Qss=;
Received: from mail-qt1-f178.google.com ([209.85.160.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pbpAe-0004l4-Eb for kgdb-bugreport@lists.sourceforge.net;
 Mon, 13 Mar 2023 20:53:30 +0000
Received: by mail-qt1-f178.google.com with SMTP id r16so14670953qtx.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 13 Mar 2023 13:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678740802;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cXlzN006xu3ZBfFq7erm402Or2NyISMhbX+wHGYXkEM=;
 b=oJVMobxQTq/fK7Mcw93LhfePaKHEdZb+5Dk0NZWNkLvoafPLA5ilrwCVU1+hj9F3bm
 9aGicSUT/WW4whH+nZ6a6/MdF20/28OZ7q5BZ0l+YHMnrKOhV3cgeU0wUL1FPepSgDP1
 ZvYdhT7QFMMlfof+AVTV7VyIpCzNau11JfmHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678740802;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cXlzN006xu3ZBfFq7erm402Or2NyISMhbX+wHGYXkEM=;
 b=wnbhinM6A3PRlolXNFZJs0FFSayvXMWXlUEpr7blZ9FfQTRg2676qTngpVvuMrhm9+
 0nZRgJFFrbsA458DBSjorlTTe3E82nW/LnTpCZ2Md3synCx+Nwau/DibIlIMeasHxt3w
 prlUPEJgll0XolB14QwU0zCwyAW7ZCtaTVefmFQDAXliEjl17prcPedYI0Q2rnaJLN8W
 VR9s2/JU/8NQrmAjh+jAApQm4l9G9m7JcVoTWRPkaf1nuqRussQzvWUuuRORXXOw12Gz
 4r/rKA5hWCfFAnSqKk4+Jj9ETPVg94Ig2ZDFymUYEL9urana6yZI3UgApcY6baS8qsCj
 QBIQ==
X-Gm-Message-State: AO0yUKWRL27hcC26f6A2MgPuUFZ089LI7NGLlCvPoqhXfHNsdPloZxjA
 4VrbENZiT0TKU6kG8tZRO5dsAEvnjLalADOCTfI=
X-Google-Smtp-Source: AK7set8y+1Db6YS1BbjOZqZ3eIY/SmiwUPzgT4uT60F8LC2gfFu0IZ5N5/fzJRwCuMkfSibuQkujdg==
X-Received: by 2002:a05:622a:d1:b0:3bf:d1b3:2bbb with SMTP id
 p17-20020a05622a00d100b003bfd1b32bbbmr25440716qtw.13.1678740801948; 
 Mon, 13 Mar 2023 13:53:21 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com.
 [209.85.128.178]) by smtp.gmail.com with ESMTPSA id
 a17-20020ac844b1000000b003a527d29a41sm476382qto.75.2023.03.13.13.53.16
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 13:53:17 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-5416949b35aso139720727b3.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 13 Mar 2023 13:53:16 -0700 (PDT)
X-Received: by 2002:a81:ed06:0:b0:540:e6c5:5118 with SMTP id
 k6-20020a81ed06000000b00540e6c55118mr6945254ywm.2.1678740794346; Mon, 13 Mar
 2023 13:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230307073155.1.Iaab0159b8d268060a0e131ebb27125af4750ef99@changeid>
 <20230307073155.2.I106c39498d8094c6f5e7ada42c7db17aa5c64e48@changeid>
In-Reply-To: <20230307073155.2.I106c39498d8094c6f5e7ada42c7db17aa5c64e48@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 Mar 2023 13:53:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XFEYPbC64TFLVUmky=1Y-b_iyqiwrALvjKTM_NWr34Dg@mail.gmail.com>
Message-ID: <CAD=FV=XFEYPbC64TFLVUmky=1Y-b_iyqiwrALvjKTM_NWr34Dg@mail.gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Tue, Mar 7, 2023 at 7:32 AM Douglas Anderson <dianders@chromium.org>
    wrote: > > On Qualcomm devices which use the "geni" serial driver, kdb/kgdb
    won't > be very happy if you use it but the resour [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.160.178 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.160.178 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pbpAe-0004l4-Eb
Subject: Re: [Kgdb-bugreport] [PATCH 2/3] serial: uart_poll_init() should
 power on the UART
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-serial@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBUdWUsIE1hciA3LCAyMDIzIGF0IDc6MzLigK9BTSBEb3VnbGFzIEFuZGVyc29uIDxk
aWFuZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+Cj4gT24gUXVhbGNvbW0gZGV2aWNlcyB3aGlj
aCB1c2UgdGhlICJnZW5pIiBzZXJpYWwgZHJpdmVyLCBrZGIva2dkYiB3b24ndAo+IGJlIHZlcnkg
aGFwcHkgaWYgeW91IHVzZSBpdCBidXQgdGhlIHJlc291cmNlcyBvZiB0aGUgcG9ydCBoYXZlbid0
IGJlZW4KPiBwb3dlcmVkIG9uLiBUb2RheSBrZGIva2dkYiByZWx5IG9uIHNvbWVvbmUgZWxzZSBw
b3dlcmluZyB0aGUgcG9ydAo+IG9uLiBUaGlzIGNvdWxkIGJlIHRoZSBub3JtYWwga2VybmVsIGNv
bnNvbGUgb3IgYW4gYWdldHR5IHJ1bm5pbmcuCj4gTGV0J3MgZml4IHRoaXMgdG8gZXhwbGljaXRs
eSBwb3dlciB0aGluZ3Mgb24gd2hlbiBzZXR0aW5nIHVwIGEgcG9sbGluZwo+IGRyaXZlci4KPgo+
IFNpZ25lZC1vZmYtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4K
PiAtLS0KPgo+ICBkcml2ZXJzL3R0eS9zZXJpYWwvc2VyaWFsX2NvcmUuYyB8IDYgKysrKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCkp1c3QgaW4gY2FzZSBpdCdzIG5vdCBv
YnZpb3VzLCBldmVuIHRob3VnaCB3ZSBlbmRlZCB1cCBnb2luZyB3aXRoCkpvaGFuJ3Mgc2VyaWVz
IFsxXSBpbnN0ZWFkIG9mIHBhdGNoICMxIG9mIG15IHNlcmllcywgcGF0Y2ggIzIgYW5kICMzCm9m
IG15IHNlcmllcyBhcmUgc3RpbGwgcmVsZXZhbnQuIEkgY2FuIHJlcG9zdCB0aGUgc2VyaWVzIHdp
dGhvdXQgcGF0Y2gKIzEgaWYgaXQncyBoZWxwZnVsLgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3IvMjAyMzAzMDcxNjQ0MDUuMTQyMTgtMS1qb2hhbitsaW5hcm9Aa2VybmVsLm9yZwoKLURv
dWcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2Ri
LWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVn
cmVwb3J0Cg==
