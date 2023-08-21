Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F969783597
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 22 Aug 2023 00:25:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qYDLD-0005St-DK
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 21 Aug 2023 22:25:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qYDLB-0005Sn-TV
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 21 Aug 2023 22:25:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+pnuXYzRxiJAi4ZTWILf7If+RLyD4xsvL3DTtJAtXks=; b=Ees3K9RanT867P34qLqjitNBcY
 2xcyahXFRvkRbtrKncqy1u+kLURbPnpz7yb+wvR2NxV4Q1KCnBMqMXSv7BDYGlTbGGE1kOe8H96WX
 oE+0FC1+4Yqc+5x+0QX3jaNW6+omCQrMJkwiU/BshLSek6xBLq8MW00jQyJ6lFWeiw2E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+pnuXYzRxiJAi4ZTWILf7If+RLyD4xsvL3DTtJAtXks=; b=UWoFfND2X5YNBg3aZZJa2j2QhH
 ef5f3qIXwHUVQBQQMAJYLoSIkQoGUOABbfeg6eIo+i5vGY0rDuNrCGXL6K4hBLaBK2ihTzV3XAXPh
 yldsAy9pRIvhqEsvGbmhG3eyPghJiVKQf4WCHHxG1dv7PFDGq/jB3dXJjlisDPkn6JV4=;
Received: from mail-lj1-f169.google.com ([209.85.208.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qYDL7-0004ba-EH for kgdb-bugreport@lists.sourceforge.net;
 Mon, 21 Aug 2023 22:25:41 +0000
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2b9db1de50cso59844471fa.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 21 Aug 2023 15:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692656730; x=1693261530;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+pnuXYzRxiJAi4ZTWILf7If+RLyD4xsvL3DTtJAtXks=;
 b=ALZZswsQQEtAu3eiTAjHLBoTiHFTxgnmG2/M7pYF4DnsbdmeG2IZ+Z6181QepMV2wF
 vOnGpVo1gFkdbBZLWp9tcp8mI+wzsWniyIv0ala4pu0LPu2cHN0rBmZ2urHSSO8JaHyw
 ixzDIqsWnadaRrojEc8wZ08gqF4Oi7rX7UFu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692656730; x=1693261530;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+pnuXYzRxiJAi4ZTWILf7If+RLyD4xsvL3DTtJAtXks=;
 b=NwVLxYMgACuvsJGY5vANnmQaI0GWfb3VvTmldfNAEEo+SV3Lisb6nG0RPyl7T2kZeZ
 3h1i9FvRNAVfx1RJXRjws02nD5JrjsamSKIlnLA56hvlG+aKMUf2L07xG/v5kPq9loA5
 1a8znQZdtbqmUDHAOvvxnLoV9Rtf+GrsDb/K7O5jxbxRwhIwBrBveNBCXMYrcW55B0Lj
 UBW82TJRYad4wQlG8XF+UXeLKl2fnPPKJlQJnWy4hKj27EmhvF+E9bf4/qfseRP4sx9q
 es7USdEJhZSwqwf3YjS6YskGuQYQUF+NafD5tb0Gpl7u4laxgDBQ7hH94WkAeFoOKmTB
 t/dA==
X-Gm-Message-State: AOJu0YzN20Uo+VKyJWru21pRnG1yYbOm6C58zyHZ6XKxfeNtWTksY7Ck
 sdtqHn8gY0nIXZnuKPkPEte7Dz3Gyej4xdvJKsqDhvX4
X-Google-Smtp-Source: AGHT+IE+KINU8p3e2L05GHmODsixpL1TjtlaDFTMFZj94DoI9y+1dypxrK6nEgTsrnOxITYc0zuqsQ==
X-Received: by 2002:a17:906:209e:b0:99b:627b:e96d with SMTP id
 30-20020a170906209e00b0099b627be96dmr6817953ejq.44.1692656230654; 
 Mon, 21 Aug 2023 15:17:10 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54]) by smtp.gmail.com with ESMTPSA id
 jt14-20020a170906ca0e00b0099cfd0b2437sm7202894ejb.99.2023.08.21.15.17.09
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Aug 2023 15:17:10 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-3fe2d620d17so31565e9.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 21 Aug 2023 15:17:09 -0700 (PDT)
X-Received: by 2002:a05:600c:82c8:b0:3f7:e4d8:2569 with SMTP id
 eo8-20020a05600c82c800b003f7e4d82569mr16271wmb.5.1692656229438; Mon, 21 Aug
 2023 15:17:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230601213440.2488667-1-dianders@chromium.org>
 <20230601143109.v9.3.Ie6c132b96ebbbcddbf6954b9469ed40a6960343c@changeid>
 <ZNDDgRuNGzovddaO@FVFF77S0Q05N.cambridge.arm.com>
In-Reply-To: <ZNDDgRuNGzovddaO@FVFF77S0Q05N.cambridge.arm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 21 Aug 2023 15:16:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VVJsJSc=uQWad4x0EV2-iROFcueW_=4VbM+0N0+aD96g@mail.gmail.com>
Message-ID: <CAD=FV=VVJsJSc=uQWad4x0EV2-iROFcueW_=4VbM+0N0+aD96g@mail.gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Mon, Aug 7, 2023 at 3:12 AM Mark Rutland <mark.rutland@arm.com>
    wrote: > > On Thu, Jun 01, 2023 at 02:31:47PM -0700, Douglas Anderson wrote:
    > > From: Sumit Garg <sumit.garg@linaro.org> > > > > I [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.169 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.169 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qYDL7-0004ba-EH
Subject: Re: [Kgdb-bugreport] [PATCH v9 3/7] arm64: Add framework for a
 debug IPI
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
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masahiro Yamada <masahiroy@kernel.org>, ito-yuichi@fujitsu.com,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Marc Zyngier <maz@kernel.org>, kgdb-bugreport@lists.sourceforge.net,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Andrey Konovalov <andreyknvl@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBNb24sIEF1ZyA3LCAyMDIzIGF0IDM6MTLigK9BTSBNYXJrIFJ1dGxhbmQgPG1hcmsu
cnV0bGFuZEBhcm0uY29tPiB3cm90ZToKPgo+IE9uIFRodSwgSnVuIDAxLCAyMDIzIGF0IDAyOjMx
OjQ3UE0gLTA3MDAsIERvdWdsYXMgQW5kZXJzb24gd3JvdGU6Cj4gPiBGcm9tOiBTdW1pdCBHYXJn
IDxzdW1pdC5nYXJnQGxpbmFyby5vcmc+Cj4gPgo+ID4gSW50cm9kdWNlIGEgZnJhbWV3b3JrIGZv
ciBhbiBJUEkgdGhhdCB3aWxsIGJlIHVzZWQgZm9yIGRlYnVnCj4gPiBwdXJwb3Nlcy4gVGhlIHBy
aW1hcnkgdXNlIGNhc2Ugb2YgdGhpcyBJUEkgd2lsbCBiZSB0byBnZW5lcmF0ZSBzdGFjawo+ID4g
Y3Jhd2xzIG9uIG90aGVyIENQVXMsIGJ1dCBpdCB3aWxsIGFsc28gYmUgdXNlZCB0byByb3VuZCB1
cCBDUFVzIGZvcgo+ID4ga2dkYi4KPiA+Cj4gPiBXaGVuIHBvc3NpYmxlLCB3ZSB0cnkgdG8gYWxs
b2NhdGUgdGhpcyBkZWJ1ZyBJUEkgYXMgYW4gTk1JIChvciBhCj4gPiBwc2V1ZG8gTk1JKS4gSWYg
dGhhdCBmYWlscyAoZHVlIHRvIENPTkZJRywgYW4gaW5jb21wYXRpYmxlIGludGVycnVwdAo+ID4g
Y29udHJvbGxlciwgYSBxdWlyaywgbWlzc2luZyB0aGUgImlycWNoaXAuZ2ljdjNfcHNldWRvX25t
aT0xIiBrZXJuZWwKPiA+IHBhcmFtZXRlciwgZXRjKSB3ZSBmYWxsIGJhY2sgdG8gYSBub3JtYWwg
SVBJLgo+ID4KPiA+IE5PVEU6IGhvb2tpbmcgdGhpcyB1cCBmb3IgQ1BVIGJhY2t0cmFjZSAvIGtn
ZGIgd2lsbCBoYXBwZW4gaW4gYSBmdXR1cmUKPiA+IHBhdGNoLCB0aGlzIGp1c3QgYWRkcyB0aGUg
ZnJhbWV3b3JrLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFN1bWl0IEdhcmcgPHN1bWl0LmdhcmdA
bGluYXJvLm9yZz4KPiA+IFNpZ25lZC1vZmYtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJz
QGNocm9taXVtLm9yZz4KPgo+IEkgdGhpbmsgdGhhdCB3ZSBzaG91bGRuJ3QgYWRkIGEgZnJhbWV3
b3JrIGluIGEgc2VwYXJhdGUgZmlsZSBmb3IgdGhpczoKPgo+ICogVGhpcyBpcyB2ZXJ5IHNpbWls
YXIgdG8gb3VyIGV4aXN0aW5nIElQSSBtYW5hZ2VtZW50IGluIHNtcC5jLCBzbyBpdCBmZWVscwo+
ICAgbGlrZSBkdXBsaWNhdGlvbiwgb3IgYXQgbGVhc3QgYW5vdGhlciB0aGluZyB3ZSdkIGxpa2Ug
dG8ga2VlcCBpbi1zeW5jLgo+Cj4gKiBXZSdyZSBnb2luZyB0byB3YW50IGFuIE5NSSBiYWNrdHJh
Y2UgcmVnYXJkbGVzcyBvZiBLR0RCCj4KPiAqIFdlJ3JlIGdvaW5nIHRvIHdhbnQgdGhlIElQSV9D
UFVfU1RPUCBhbmQgSVBJX0NSQVNIX0NQVV9TVE9QIElQSXMgdG8gYmUgTk1Jcwo+ICAgdG9vLgo+
Cj4gSSByZWNrb24gaXQnZCBiZSBiZXR0ZXIgdG8gZXh0ZW5kIHRoZSBleGlzdGluZyBJUEkgbG9n
aWMgaW4gc21wLmMgdG8gYWxsb3cgSVBJcwo+IHRvIGJlIHJlcXVlc3RlZCBhcyBOTUlzLCBlLmcu
Cj4KPiAtLS0tCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva2VybmVsL3NtcC5jIGIvYXJjaC9h
cm02NC9rZXJuZWwvc21wLmMKPiBpbmRleCBlZGQ2Mzg5NGQ2MWU4Li40OGU2YWE2MmM0NzNlIDEw
MDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQva2VybmVsL3NtcC5jCj4gKysrIGIvYXJjaC9hcm02NC9r
ZXJuZWwvc21wLmMKPiBAQCAtMzMsNiArMzMsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgva2VybmVs
X3N0YXQuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2tleGVjLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9r
dm1faG9zdC5oPgo+ICsjaW5jbHVkZSA8bGludXgvbm1pLmg+Cj4KPiAgI2luY2x1ZGUgPGFzbS9h
bHRlcm5hdGl2ZS5oPgo+ICAjaW5jbHVkZSA8YXNtL2F0b21pYy5oPgo+IEBAIC05MjYsNiArOTI3
LDIxIEBAIHN0YXRpYyB2b2lkIHNtcF9jcm9zc19jYWxsKGNvbnN0IHN0cnVjdCBjcHVtYXNrICp0
YXJnZXQsIHVuc2lnbmVkIGludCBpcGlucikKPiAgICAgICAgIF9faXBpX3NlbmRfbWFzayhpcGlf
ZGVzY1tpcGlucl0sIHRhcmdldCk7Cj4gIH0KPgo+ICtzdGF0aWMgYm9vbCBpcGlfc2hvdWxkX2Jl
X25taShlbnVtIGlwaV9tc2dfdHlwZSBpcGkpCj4gK3sKPiArICAgICAgIGlmICghc3lzdGVtX3Vz
ZXNfaXJxX3ByaW9fbWFza2luZygpKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4g
Kwo+ICsgICAgICAgc3dpdGNoIChpcGkpIHsKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBUT0RP
OiBzZWxlY3QgTk1JIElQSXMgaGVyZQo+ICsgICAgICAgICovCj4gKyAgICAgICAgICAgICAgIHJl
dHVybiB0cnVlOwo+ICsgICAgICAgZGVmYXVsdDoKPiArICAgICAgICAgICAgICAgcmV0dXJuIGZh
bHNlOwo+ICsgICAgICAgfQo+ICt9Cj4gKwo+ICBzdGF0aWMgdm9pZCBpcGlfc2V0dXAoaW50IGNw
dSkKPiAgewo+ICAgICAgICAgaW50IGk7Cj4gQEAgLTkzMyw4ICs5NDksMTQgQEAgc3RhdGljIHZv
aWQgaXBpX3NldHVwKGludCBjcHUpCj4gICAgICAgICBpZiAoV0FSTl9PTl9PTkNFKCFpcGlfaXJx
X2Jhc2UpKQo+ICAgICAgICAgICAgICAgICByZXR1cm47Cj4KPiAtICAgICAgIGZvciAoaSA9IDA7
IGkgPCBucl9pcGk7IGkrKykKPiAtICAgICAgICAgICAgICAgZW5hYmxlX3BlcmNwdV9pcnEoaXBp
X2lycV9iYXNlICsgaSwgMCk7Cj4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwgbnJfaXBpOyBpKysp
IHsKPiArICAgICAgICAgICAgICAgaWYgKGlwaV9zaG91bGRfYmVfbm1pKGkpKSB7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcHJlcGFyZV9wZXJjcHVfbm1pKGlwaV9pcnFfYmFzZSArIGkpOwo+
ICsgICAgICAgICAgICAgICAgICAgICAgIGVuYWJsZV9wZXJjcHVfbm1pKGlwaV9pcnFfYmFzZSAr
IGksIDApOwo+ICsgICAgICAgICAgICAgICB9IGVsc2Ugewo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGVuYWJsZV9wZXJjcHVfaXJxKGlwaV9pcnFfYmFzZSArIGksIDApOwo+ICsgICAgICAgICAg
ICAgICB9Cj4gKyAgICAgICB9Cj4gIH0KPgo+ICAjaWZkZWYgQ09ORklHX0hPVFBMVUdfQ1BVCj4g
QEAgLTk0NSw4ICs5NjcsMTQgQEAgc3RhdGljIHZvaWQgaXBpX3RlYXJkb3duKGludCBjcHUpCj4g
ICAgICAgICBpZiAoV0FSTl9PTl9PTkNFKCFpcGlfaXJxX2Jhc2UpKQo+ICAgICAgICAgICAgICAg
ICByZXR1cm47Cj4KPiAtICAgICAgIGZvciAoaSA9IDA7IGkgPCBucl9pcGk7IGkrKykKPiAtICAg
ICAgICAgICAgICAgZGlzYWJsZV9wZXJjcHVfaXJxKGlwaV9pcnFfYmFzZSArIGkpOwo+ICsgICAg
ICAgZm9yIChpID0gMDsgaSA8IG5yX2lwaTsgaSsrKSB7Cj4gKyAgICAgICAgICAgICAgIGlmIChp
cGlfc2hvdWxkX2JlX25taShpKSkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGRpc2FibGVf
cGVyY3B1X25taShpcGlfaXJxX2Jhc2UgKyBpKTsKPiArICAgICAgICAgICAgICAgICAgICAgICB0
ZWFyZG93bl9wZXJjcHVfbm1pKGlwaV9pcnFfYmFzZSArIGkpOwo+ICsgICAgICAgICAgICAgICB9
IGVsc2Ugewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGRpc2FibGVfcGVyY3B1X2lycShpcGlf
aXJxX2Jhc2UgKyBpKTsKPiArICAgICAgICAgICAgICAgfQo+ICsgICAgICAgfQo+ICB9Cj4gICNl
bmRpZgo+Cj4gQEAgLTk1OCwxMSArOTg2LDE5IEBAIHZvaWQgX19pbml0IHNldF9zbXBfaXBpX3Jh
bmdlKGludCBpcGlfYmFzZSwgaW50IG4pCj4gICAgICAgICBucl9pcGkgPSBtaW4obiwgTlJfSVBJ
KTsKPgo+ICAgICAgICAgZm9yIChpID0gMDsgaSA8IG5yX2lwaTsgaSsrKSB7Cj4gLSAgICAgICAg
ICAgICAgIGludCBlcnI7Cj4gLQo+IC0gICAgICAgICAgICAgICBlcnIgPSByZXF1ZXN0X3BlcmNw
dV9pcnEoaXBpX2Jhc2UgKyBpLCBpcGlfaGFuZGxlciwKPiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICJJUEkiLCAmY3B1X251bWJlcik7Cj4gLSAgICAgICAgICAgICAg
IFdBUk5fT04oZXJyKTsKPiArICAgICAgICAgICAgICAgaW50IGVyciA9IC1FSU5WQUw7Cj4gKwo+
ICsgICAgICAgICAgICAgICBpZiAoaXBpX3Nob3VsZF9iZV9ubWkoaSkpIHsKPiArICAgICAgICAg
ICAgICAgICAgICAgICBlcnIgPSByZXF1ZXN0X3BlcmNwdV9ubWkoaXBpX2Jhc2UgKyBpLCBpcGlf
aGFuZGxlciwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIklQSSIsICZjcHVfbnVtYmVyKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBXQVJOKGVy
ciwgIkNvdWxkIG5vdCByZXF1ZXN0IElQSSAlZCBhcyBOTUksIGVycj0lZFxuIiwKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGksIGVycik7Cj4gKyAgICAgICAgICAgICAgIH0gZWxzZSB7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZXJyID0gcmVxdWVzdF9wZXJjcHVfaXJxKGlwaV9i
YXNlICsgaSwgaXBpX2hhbmRsZXIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICJJUEkiLCAmY3B1X251bWJlcik7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgV0FSTihlcnIsICJDb3VsZCBub3QgcmVxdWVzdCBJUEkgJWQgYXMgSVJRLCBlcnI9JWRc
biIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBpLCBlcnIpOwo+ICsgICAgICAgICAg
ICAgICB9Cj4KPiAgICAgICAgICAgICAgICAgaXBpX2Rlc2NbaV0gPSBpcnFfdG9fZGVzYyhpcGlf
YmFzZSArIGkpOwo+ICAgICAgICAgICAgICAgICBpcnFfc2V0X3N0YXR1c19mbGFncyhpcGlfYmFz
ZSArIGksIElSUV9ISURERU4pOwo+IC0tLS0KPgo+IC4uLiBhbmQgdGhlbiBpZiB3ZSBuZWVkIGFu
IElQSSBmb3IgS0dEQiwgd2UgY2FuIGFkZCB0aGF0IHRvIHRoZSBleGlzdGluZyBsaXN0Cj4gb2Yg
SVBJcywgYW5kIGhhdmUgaXQgcmVxdWVzdGVkL2VuYWJsZWQvZGlzYWJsZWQgYXMgdXN1YWwuCgpT
b3VuZHMgZ29vZC4gSSdtIHN0YXJ0aW5nIHRvIHdvcmsgb24gdjEwIGluY29ycG9yYXRpbmcgeW91
ciBmZWVkYmFjay4KQSBmZXcgcXVpY2sgcXVlc3Rpb25zOgoKMS4gSWYgSSBtb3N0bHkgdGFrZSB5
b3VyIHBhdGNoIGFib3ZlIHZlcmJhdGltLCBkbyB5b3UgaGF2ZSBhbnkKc3VnZ2VzdGVkIHRhZ3Mg
Zm9yIEF1dGhvci9TaWduZWQtb2ZmLWJ5PyBJJ2QgdGVuZCB0byBzZXQgeW91IGFzIHRoZQphdXRo
b3IgYnV0IEkgY2FuJ3QgZG8gdGhhdCBiZWNhdXNlIHlvdSBkaWRuJ3QgcHJvdmlkZSBhClNpZ25l
ZC1vZmYtYnkuLi4KCjIuIFdvdWxkIHlvdSBwcmVmZXIgdGhpcyBwYXRjaCBvbiBpdHMgb3duLCBv
ciB3b3VsZCB5b3UgcmF0aGVyIGl0IGJlCnNxdWFzaGVkIHdpdGggdGhlIGZpcnN0IHVzZXIgKCJi
YWNrdHJhY2UiKT8gT24gaXRzIG93biwgSSB0aGluayBJIGhhdmUKdG8gZ2V0IHJpZCBvZiB0aGUg
InN3aXRjaCIgc3RhdGVtZW50IGluIGlwaV9zaG91bGRfYmVfbm1pKCkgYW5kIGp1c3QKcmV0dXJu
IGZhbHNlOwoKVGhhbmtzIQoKLURvdWcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBv
cnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
